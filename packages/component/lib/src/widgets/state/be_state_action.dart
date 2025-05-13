abstract class BeStateAction {}

class SetStateAction<S> extends BeStateAction {
  SetStateAction(this.state);
  final S state;
}
