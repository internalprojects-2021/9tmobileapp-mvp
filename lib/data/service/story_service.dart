import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/story.dart';

class StoryService extends BaseService {
  Map<String, Story> storyCache = {};

  Future<Story?> getStory({String id = 'a38cd7f4-a90f-4e1e-94b3-7b9858ba2242'}) async {
    try {
      if (!storyCache.containsKey(id)) {
        var story = await client.getStory({});
        storyCache[story.id] = story;
      }
      return storyCache[id];
    } catch (e) {
      return null;
    }
  }
}
