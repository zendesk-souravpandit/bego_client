import 'package:becomponent/src/page/be_page_section_resolver.dart';
import 'package:becore/getx.dart';

class BePageController<S> extends StateController<S> {
  BePageController();

  final RxMap<BeSection, GetStatus<S?>> _statusMap = RxMap<BeSection, GetStatus<S?>>({});

  final Set<BeSection> _attachedSections = {};

  @override
  void onInit() {
    super.onInit();
  }

  GetStatus<S?>? getStatus(final BeSection section) => _statusMap[section];

  void attach(final BeSection section) {
    _attachedSections.add(section);
    load(section);
  }

  void detach(final BeSection section) {
    _attachedSections.remove(section);
    _statusMap.remove(section);
  }

  Future<void> load(final BeSection section) async {
    if (!_attachedSections.contains(section)) return;
    _statusMap[section] = LoadingStatus<S>();
    update([section]);
    try {
      final data = await fetchViewSection(section);
      if (!_attachedSections.contains(section)) return;
      _statusMap[section] = (data == null) ? EmptyStatus<S>() : SuccessStatus<S>(data);
    } catch (error) {
      if (!_attachedSections.contains(section)) return;
      _statusMap[section] = ErrorStatus<S, Object>(error);
    }

    update([section]); // Only notify listeners watching this section's ID
  }

  Future<S?> fetchViewSection(final BeSection section) async {
    return null;
  }
}
