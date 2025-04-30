// @input Component.Camera mainCamera
// @input SceneObject pingPongBall
// @input float throwForce = 10.0 {"min":1.0, "max":30.0, "step":0.5}
// @input float throwUpwardAngle = 45.0 {"min":0.0, "max":90.0, "step":1.0}
// @input float throwVariation = 5.0 {"min":0.0, "max":20.0, "step":0.5}
// @input bool resetBallAfterThrow = true
// @input float resetDelay = 3.0 {"min":0.5, "max":10.0, "step":0.5}
// @input vec3 startPosition = {x: 0, y: 0, z: 0}

// Store initial position for resetting
var initialPosition = script.startPosition;
var isReady = true;
var throwCount = 0;

// Initialize the ball
function initialize() {
    // Set the ball at the starting position
    script.pingPongBall.getTransform().setLocalPosition(initialPosition);
    
    // Make sure the ball is visible
    script.pingPongBall.enabled = true;
    
    isReady = true;
}

// Call initialize at the start
initialize();

// Handle the throw
function throwBall(eventData) {
    // Only throw if the ball is ready to be thrown
    if (!isReady) return;
    
    throwCount++;
    
    // Add a small random variation to the throw direction
    var variationX = (Math.random() * 2 - 1) * script.throwVariation;
    var variationY = (Math.random() * script.throwVariation * 0.5);
    var variationZ = (Math.random() * 2 - 1) * script.throwVariation;
    
    // Calculate the throw direction based on camera
    var cameraTransform = script.mainCamera.getTransform();
    var forward = cameraTransform.forward;
    
    // Apply the upward angle
    var angleInRadians = script.throwUpwardAngle * Math.PI / 180;
    var y = Math.sin(angleInRadians);
    var flatForwardLength = Math.cos(angleInRadians);
    
    // Calculate throw direction with the angle applied
    var throwDirection = new vec3(
        forward.x * flatForwardLength + variationX / 100,
        y + variationY / 100,
        forward.z * flatForwardLength + variationZ / 100
    );
    
    // Normalize the direction
    throwDirection = throwDirection.normalize();
    
    // Calculate the final force vector
    var force = throwDirection.uniformScale(script.throwForce);
    
    // Position the ball slightly in front of the camera
    var startPos = cameraTransform.getWorldPosition().add(forward.uniformScale(0.2));
    script.pingPongBall.getTransform().setWorldPosition(startPos);
    
    // Apply physics impulse to the ball using Physics API
    // In Lens Studio 5.7.2, we use the global Physics API
    var physicsContext = Physics.createContext();
    physicsContext.setPosition(script.pingPongBall, startPos);
    physicsContext.applyImpulse(script.pingPongBall, force);
    
    print("Threw ball " + throwCount + " with force: " + force.toString());
    
    // Set the ball as not ready to throw
    isReady = false;
    
    // Reset the ball after a delay if enabled
    if (script.resetBallAfterThrow) {
        // Use a delayed callback to reset
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(resetBall);
        delayedEvent.reset(script.resetDelay);
    }
}

// Reset the ball to initial position
function resetBall() {
    // Return the ball to its initial position
    script.pingPongBall.getTransform().setLocalPosition(initialPosition);
    
    // Reset physics state using Physics API
    var physicsContext = Physics.createContext();
    physicsContext.setLinearVelocity(script.pingPongBall, new vec3(0, 0, 0));
    physicsContext.setAngularVelocity(script.pingPongBall, new vec3(0, 0, 0));
    
    // Ball is ready to throw again
    isReady = true;
    
    print("Ball reset and ready to throw again");
}

// Bind to touch/tap event
var touchEvent = script.createEvent("TouchEndEvent");
touchEvent.bind(throwBall);

// You can also reset manually if needed
// script.api.resetBall = resetBall;