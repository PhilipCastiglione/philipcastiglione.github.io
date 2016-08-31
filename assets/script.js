function ready(cb) {
  if (document.readyState != 'loading'){
    cb();
  } else {
    document.addEventListener('DOMContentLoaded', cb);
  }
}

var main = function() {
  new Clipboard("#copy");
};

ready(main);
