
// class ImageFileReader extends FileReaderExt {
//   constructor() {
//     super();
//     this.image_types = ['image/jpeg'];
//   }

//   isImage(file) {
//     if (file) {
//       if ('type' in file) {
//         for (let type of this.image_types) {
//           if (type.includes(file.type)) return true;
//         }
//       }
//     }
//     return false;
//   }

//   ResizeImage(file) {
//     /* maybe we will use this maybe we will not */
//     let urlsrc = URL.createObjectURL(file);
//     let img = new Image();
//     img.onload = function () {
//       let canvas = document.createElement('canvas');
//       let copycanvas = document.createElement('canvas');

//       let ctx = canvas.getContext('2d');
//       let copyctx = copycanvas.getContext('2d');

//       let max_height = 1080;
//       let max_width = 810;
//       let ratio = 1;

//       // switch the values
//       if (img.width > img.height) {
//         max_height ^= max_width;
//         max_width ^= max_height;
//         max_height ^= max_width;
//       }
//       // so JPEG uses exif to coordinate rotation / mirroring
//       // process JPEG files as is for now
//       // TODO: this.ImageOrientation(img);

//       // img rotated 90 degrees cc, so img.width => height, and img.height => width
//       if (img.height > max_height) {
//         ratio = max_height / img.height;
//       } else {
//         ratio = max_width / img.width;
//       }
//       console.log(ratio);

//       // for some reason, img is always rendered rotated -90* from img.src
//       copycanvas.width = img.width;
//       copycanvas.height = img.height;
//       //let halfs = [img.width / 2, img.height /2];
//       //copyctx.translate(halfs[0], halfs[1]);
//       //copyctx.rotate(Math.PI/2);
//       //copyctx.drawImage(img, -halfs[0], -halfs[1]);
//       copyctx.drawImage(img, 0, 0);

//       canvas.width = copycanvas.width * ratio;
//       canvas.height = copycanvas.height * ratio;
//       ctx.drawImage(copycanvas, 0, 0, copycanvas.width, copycanvas.height, 0, 0, canvas.width, canvas.height);
//       let newimage = {
//         'name': file.name,
//         'content': canvas.toDataURL(file.type),
//         'type': file.type
//       };

//       URL.revokeObjectURL(urlsrc);
//     }
//     img.src = urlsrc;
//   }

// }