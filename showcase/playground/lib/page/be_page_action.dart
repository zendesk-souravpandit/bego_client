abstract class BePageAction {}

class SetStateAction<S> extends BePageAction {
  SetStateAction(this.state);
  final S state;
}
