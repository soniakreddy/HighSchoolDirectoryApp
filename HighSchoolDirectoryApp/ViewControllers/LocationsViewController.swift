//
//  LocationsViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit
import MapKit

class LocationsViewController: UIViewController {
    private var locationDetails: LocationDetails
    private var isListView = true
    private var locationManager: CLLocationManager?
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = Constants.tableViewIdentifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.separatorInset = UIEdgeInsets(top: 0, left: Constants.seperatorInsetSideMargin, bottom: 0, right: Constants.seperatorInsetSideMargin)
        tableView.backgroundColor = .victoriaBlueColor
        tableView.isHidden = true
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var mapView : MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.isHidden = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.accessibilityIdentifier = Constants.mapViewIdentifier
        return mapView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [Constants.detailsTitle, Constants.mapTitle])
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.layer.borderWidth = 1
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constants.extraSmallFontSize, weight: .regular)], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constants.extraSmallFontSize, weight: .regular)], for: .selected)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.accessibilityIdentifier = Constants.segmentedControlIdentifier
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    init(locationDetails: LocationDetails) {
        self.locationDetails = locationDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(mapView)
        view.backgroundColor = .victoriaBlueColor
        
        setupNavigationBar()
        setupConstraints()
        setupMapView()
        updateViewVisibility()
    }
    
    private func updateViewVisibility() {
        tableView.isHidden = !isListView
        mapView.isHidden = isListView
        navigationItem.rightBarButtonItem?.isHidden = isListView
    }
    
    private func setupNavigationBar() {
        let shareDirections = UIBarButtonItem(image: UIImage(systemName: Constants.forwardArrowIcon), style: .plain, target: self, action: #selector(shareDirectionsTapped))
        shareDirections.accessibilityLabel = Constants.shareDirectionAccessibilityLabel
        shareDirections.accessibilityHint = Constants.shareDirectionAccessibilityHint
        navigationItem.rightBarButtonItem = shareDirections
        navigationItem.titleView = segmentedControl
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:  UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setupConstraints() {
        var customConstraints = [NSLayoutConstraint]()
        
        customConstraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        customConstraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        customConstraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        customConstraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        customConstraints.append(mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        customConstraints.append(mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        customConstraints.append(mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        customConstraints.append(mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(customConstraints)
        
    }
    
    private func setPinUsingMKAnnotation(location: CLLocationCoordinate2D) {
        let pin = MapPin(title: locationDetails.address.schoolName, locationName: locationDetails.address.location, coordinate: location)
       let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(pin)
    }
    
    private func setupMapView() {
        let initialLocation = CLLocation(latitude: 40.730610, longitude: -73.935242)
        mapView.centerToLocation(initialLocation)
        
        guard let latitude = locationDetails.address.latitude, let longitude = locationDetails.address.longitude else { return }
        guard let lat = Double(latitude), let long = Double(longitude) else { return }

        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        mapView.delegate = self
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        setPinUsingMKAnnotation(location: location)
    }
    
    @objc private func shareDirectionsTapped(_ sender: UIButton) {
        guard let latitude = locationDetails.address.latitude, let longitude = locationDetails.address.longitude else { return }
        guard let lat = Double(latitude), let long = Double(longitude) else { return }
        let coordinate = CLLocationCoordinate2DMake(lat, long)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = Constants.targetLocation
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    @objc private func segmentedControlDidChange(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 1 {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.requestAlwaysAuthorization()
        }
        isListView = sender.selectedSegmentIndex == 0
        updateViewVisibility()
        view.setNeedsDisplay()
    }
}

extension LocationsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
        pin.canShowCallout = true
        if annotation.isEqual(mapView.userLocation) {
            return nil
        }
        return pin
    }
}

private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

extension LocationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}

extension LocationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = Constants.addressTitle
        } else if section == 1 {
            title = Constants.neighborhoodDetailsTitle
        } else if section == 2 {
            title = Constants.transportationOptionsTitle
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return locationDetails.neighborhoodDetails.valueRows.count
        } else if section == 2 {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.tableViewCellIdentifier)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        if indexPath.section == 0 {
            let addressText = locationDetails.address.primaryAddressLine + ",\n" + locationDetails.address.city + ",\n" + locationDetails.address.stateCode + ",\n" + locationDetails.address.zipCode
            cell.textLabel?.text = addressText
        } else if indexPath.section == 1 {
            let details = locationDetails.neighborhoodDetails.valueRows[indexPath.row]
            cell.textLabel?.text = details.title
            cell.detailTextLabel?.text = details.value
        } else if indexPath.section == 2 {
            let details = locationDetails.transportationOptions.valueRows[indexPath.row]
            cell.textLabel?.text = details.title
            cell.detailTextLabel?.text = details.value
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
    
}

extension LocationsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            mapView.isHidden = true
            let alert = UIAlertController(title: "", message:Constants.locationServicePromptMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: Constants.ok, style: .default) {
                        UIAlertAction in
                        let settingsUrl = NSURL(string: UIApplication.openSettingsURLString)
                        if let url = settingsUrl {
                            UIApplication.shared.open(url as URL)
                        }
                    }
            let cancelAction =  UIAlertAction(title: Constants.cancel, style: .cancel, handler: nil)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
