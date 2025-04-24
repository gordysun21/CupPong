// @input SceneObject sphere
// @input float pinchThreshold = 0.03

var sphereBody = script.sphere.getComponent("Physics.BodyComponent");
var isGrabbing = false;
var prevPos = null;
var velocity = vec3.zero();

function getPinchDistance() {
    var thumb = HandTracking.getJointPose(4, 1); // Thumb tip
    var index = HandTracking.getJointPose(8, 1); // Index tip
    if (thumb && index) {
        return thumb.worldPosition.distance(index.worldPosition);
    }
    return 999;
}

function update() {
    var pinchDist = getPinchDistance();
    var thumb = HandTracking.getJointPose(4, 1);
    var index = HandTracking.getJointPose(8, 1);

    if (!thumb || !index) return;

    var pinchPos = index.worldPosition.add(thumb.worldPosition).uniformScale(0.5);

    if (pinchDist < script.pinchThreshold && !isGrabbing) {
        print("DEBUG: Pinch start");
        isGrabbing = true;
        sphereBody.setKinematic(true); // Disable physics
    }

    if (isGrabbing && pinchDist < script.pinchThreshold) {
        // Holding object
        sphereBody.getTransform().setWorldPosition(pinchPos);

        if (prevPos) {
            velocity = pinchPos.sub(prevPos).uniformScale(1 / getDeltaTime());
        }
        prevPos = pinchPos;
    }

    if (isGrabbing && pinchDist >= script.pinchThreshold) {
        // Release throw
        print("DEBUG: Released throw with velocity " + velocity.toString());
        sphereBody.setKinematic(false); // Re-enable physics
        sphereBody.setLinearVelocity(velocity);
        isGrabbing = false;
        prevPos = null;
    }
}

script.createEvent("UpdateEvent").bind(update);
