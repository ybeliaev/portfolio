# Portfolio

+ `npm init`
+ parceljs install... - сборщик для js:
+ https://parceljs.org/getting-started/webapp/
+ `npm install --save-dev parcel`
+ `npx parcel index.html`
+ THREE install
+ `npm install three` 
+ copy code from `https://github.com/mrdoob/three.js/`
+ add `type="module"` to `script`
+ have base code:

```js
console.log(new Date().toLocaleTimeString());

import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

export default class Sketch {
  constructor(options) {
    this.container = options.domElement;
    this.width = this.container.offsetWidth;
    this.height = this.container.offsetHeight;

    this.camera = new THREE.PerspectiveCamera(70, this.width / this.height, 0.01, 10);
    this.camera.position.z = 1;

    this.scene = new THREE.Scene();
    this.renderer = new THREE.WebGLRenderer({ antialias: true });
    this.renderer.setPixelRatio(window.devicePixelRatio);
    // this.renderer.setPixelRatio(2);

    this.container.appendChild(this.renderer.domElement);
    this.controls = new OrbitControls(this.camera, this.renderer.domElement);

    // this.renderer.setAnimationLoop(animation);

    this.time = 0;
    this.resize();
    this.addObjects();
    this.render();

    this.setupResize();
  }
  resize() {
    this.width = this.container.offsetWidth;
    this.height = this.container.offsetHeight;
    this.renderer.setSize(this.width, this.height);
    this.camera.aspect = this.width / this.height;
    this.camera.updateProjectionMatrix(); // без этого фигура не сохраняет пропорции при ресайзе
  }

  setupResize() {
    addEventListener("resize", this.resize.bind(this));
  }

  addObjects() {
    this.geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
    this.material = new THREE.MeshNormalMaterial();

    this.mesh = new THREE.Mesh(this.geometry, this.material);
    this.scene.add(this.mesh);
  }

  render() {
    this.time += 0.5;
    console.log(this.time);

    this.mesh.rotation.x = this.time / 2000;
    this.mesh.rotation.y = this.time / 1000;

    this.renderer.render(this.scene, this.camera);
    requestAnimationFrame(this.render.bind(this));
  }
}
new Sketch({
  domElement: document.getElementById("container"),
});



```