class type font = object  end
class type paint = object  end
class type common_attr = object  end
class type circle_attr =
  object
    method cx : int Js.prop
    method cy : int Js.prop
    method fill : paint Js.prop
    method r : int Js.prop
    method stroke : paint Js.prop
  end
class type ellipse_attr =
  object
    method cx : int Js.prop
    method cy : int Js.prop
    method fill : paint Js.prop
    method stroke : paint Js.prop
  end
class type rect_attr =
  object
    method fill : paint Js.prop
    method height : int Js.prop
    method rx : int Js.prop
    method ry : int Js.prop
    method stroke : paint Js.prop
    method width : int Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type image_attr =
  object
    method fill : paint Js.prop
    method height : int Js.prop
    method rx : int Js.prop
    method ry : int Js.prop
    method src : Js.js_string Js.t Js.prop
    method stroke : paint Js.prop
    method width : int Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type path_attr =
  object
    method fill : paint Js.prop
    method path : Js.js_string Js.t Js.prop
    method stroke : paint Js.prop
  end
class type text_attr =
  object
    method font : font Js.prop
    method opacity : float Js.prop
    method rotation : int Js.prop
    method x : int Js.prop
    method y : int Js.prop
  end
class type set_attr =
  object

  end
