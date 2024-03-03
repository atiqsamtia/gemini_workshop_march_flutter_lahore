import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini {
  String apikey = 'ADD_YOUR_API_KEY_HERE';

  Future<String?> getText(String prompt) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    print(response);
    return response.text;
  }

  Future<String?> getFlutterDev(String question) async {
    String basePrompt =
        'You are a Expert Flutter Developer, answer following question from flutter knowledgbase with best practices and code examples, step by step guide and be as detailed as possible. here is the question: $question';
    return getText(basePrompt);
  }

  Future<String?> getUpworkProposal(String question) async {
    String basePrompt =
        'You are an expert Upwork Freelancer for Flutter Mobile App development, your skills are impressive UI, performant app, rest api, firebase, ai. Generate a brief proposal no more than 2 paragraphs for upwork job description given at the end, utilize my skills and use good marketing knowledge for winning proposal. Here is the job description: $question';
    return getText(basePrompt);
  }
}
