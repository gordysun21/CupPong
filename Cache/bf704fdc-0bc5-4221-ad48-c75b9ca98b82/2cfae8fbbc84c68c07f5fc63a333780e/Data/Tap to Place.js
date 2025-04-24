// @input Component.DeviceTracking deviceTracking
// @input SceneObject objectToPlace

function onTap(eventData) {
    var screenPos = eventData.getTapPosition();
    var hits = script.deviceTracking.hitTestWorldMesh(screenPos);

    if (hits.length > 0) {
        var point = hits[0].position;
        var normal = hits[0].normal;

        // Position the object
        script.objectToPlace.getTransform().setWorldPosition(point);

        // Orient it to sit flush with surface
        var up = vec3.up();
        var forwardDir = up.projectOnPlane(normal).normalize();
        var rot = quat.lookAt(forwardDir, normal);
        script.objectToPlace.getTransform().setWorldRotation(rot);
    }
}

script.createEvent("TapEvent").bind(onTap);
