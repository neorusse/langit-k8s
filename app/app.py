"""
A Simple Flask Web Application interface
For viewing popular GitHub Repos sorted by stars using the
GitHub Search API.

"""

from flask import Flask, render_template, request

from main.exceptions import GitHubApiException
from main.api import repos_with_most_stars

app = Flask(__name__)

available_languages = ["Python", "JavaScript", "Ruby", "Java"]

@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'GET':
        # Use the list of all languages
        selected_languages = available_languages
    elif request.method == 'POST':
        # Use the languages we selected in the request form
        selected_languages = request.form.getlist("languages")

    results = repos_with_most_stars(selected_languages)

    return render_template(
        'index.html',
        selected_languages=selected_languages,
        available_languages=available_languages,
        results=results)


@app.errorhandler(GitHubApiException)
def handle_api_error(error):
    return render_template('error.html', message=error)


if __name__ == "__main__":
   app.run(host='0.0.0.0')
