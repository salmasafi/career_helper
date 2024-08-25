from flask import Flask, request, jsonify
import google.generativeai as genai

app = Flask(__name__)

api_key = "AIzaSyB967_GmEu37sGHzTrzPcCtq7C2IudLqqs"
genai.configure(api_key=api_key)

generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 64,
  "max_output_tokens": 8192,
  "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
  model_name="gemini-1.5-flash",
  generation_config=generation_config,
  system_instruction="انت مساعد شخصي مهمتك تساعد المستخدم في بناء خطة تطوير مهني بدقة عالية، مع مراعاة إنك تسأله أقل عدد ممكن من الأسئلة. لازم تركز على تحديد نقاط الضعف اللي عنده وتساعده يطورها عشان يقدر يلاقي شغل مناسب في السوق المصري. الحوار بينك وبين المستخدم لازم يكون بالعامية المصرية.\n\n1. الترحيب والتعارف: ابدأ الحوار بالترحيب بالمستخدم. اسأله عن مجاله الحالي أو إذا كان لسه في بداية حياته المهنية.\n\n2. تحديد الهدف: اسأله عن هدفه الوظيفي الأساسي. مثلا: \"نفسك توصل لإيه في شغلك؟\" أو \"إيه الوظيفة اللي بتحلم بيها؟\".\n\n3. تقييم المهارات الحالية: اطلب منه يحدد المهارات اللي بيعتقد إنه شاطر فيها، وكمان اللي محتاج يطورها. ممكن تسأله: \"إيه المهارات اللي حاسس إنك محتاج تقويها عشان توصل لهدفك؟\".\n\n4. تحديد الفجوات والضعف: بناءً على إجاباته، ساعده يحدد نقاط الضعف اللي ممكن تكون عائق قدامه. حاول تسأله بشكل مباشر: \"هل في حاجات معينة حاسس إنها بتعطلك عن التقدم؟\".\n\n5. تقديم النصائح العملية: اقترح عليه نصائح وأدوات عملية يقدر يستخدمها لتطوير مهاراته. ركز على حاجات تكون فعلاً مفيدة في السوق المصري، زي دورات تدريبية أو مواقع تعليمية.\n\n6. خطة العمل: بعد ما تجمع كل المعلومات، ساعده في وضع خطة عمل بسيطة ومنظمة. خليك محدد في الخطوات وتابع معاه بشكل دوري.\n\n7. التشجيع والمتابعة: اختم الحوار بتشجيعه وتحفيزه على الالتزام بالخطة. اقترح عليه إنه يرجع يتكلم معاك لو احتاج مساعدة أو متابعة.",
)

@app.route('/get_development_plan', methods=['POST'])
def get_development_plan():
    user_input = request.json.get('input')
    chat_session = model.start_chat(
      history=[
        {
          "role": "user",
          "parts": [user_input],
        }
      ]
    )
    response = chat_session.send_message(user_input)
    return jsonify({"response": response.text})

if __name__ == '__main__':
    app.run(debug=True)
