class MouseDraggable extends Component {

  // fields
  boolean isUI = true;

  MouseDraggable(Actor parent) {

    this.parent = parent;

    name = "mouse_draggable";
  }

  void update() {

    if (isUI) {
      if (parent.checkCollision(mouseX, mouseY)) {

        uiTryDraggingActor(parent);
        return;
      }
    }

    if (parent.checkCollision(cursor)) {


      cursor.tryDraggingActor(parent);
    }
  }

  void draw() {
  }
}


Actor globalMouseDraggingActor;

boolean isDraggingActor(Actor a) {

  return a.equals(globalMouseDraggingActor) && mousePressed;
}

void uiTryDraggingActor(Actor a) {

  if (globalMouseDraggingActor == null && cursor.draggingTarget == null ) globalMouseDraggingActor = a;

  if (isDraggingActor(a)) {

    globalMouseDraggingActor.x = mouseX;
    globalMouseDraggingActor.y = mouseY;
  }

  if (!mousePressed) globalMouseDraggingActor = null;
}
