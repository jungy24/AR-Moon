//
//  ViewController.swift
//  practiceAR
//
//  Created by Jungyoon Yu on 9/23/17.
//  Copyright © 2017 Jungyoon Yu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // creating a sphere and assigning it the texture/image of the moon
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/moon_texture.jpg")
        sphere.materials = [material]
        
        // creating a node object i.e. a coordinate position in space
        let node = SCNNode()
        node.position = SCNVector3(x:0, y:0.1, z:-0.5)
        
        //placing our moon to the position/node we created
        node.geometry = sphere
        
        //adding the moon to the scene
        sceneView.scene.rootNode.addChildNode(node)
        
        //projects light on the moon and makes it look like 3d object
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
