void main(){
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );
}