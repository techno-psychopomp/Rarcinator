import sys
import os
import openai
import subprocess

openai.api_key = os.environ['OPENAI_API_KEY']

def read_file(filename):
    with open(filename) as f:
        contents = f.read()
        f.close()
        return contents

def write_file(filename, contents):
    with open(filename, 'w') as f:
        f.write(contents)
        f.close()
        return
    
def build_prompt(contents):
    prompt = 'Given this file:\n'
    prompt += contents
    prompt += 'correct spelling and grammar'
    return prompt

def send_to_openai(prompt):
    response = openai.Completion.create(
        model = "text-davinci-003",
        prompt = prompt,
        temperature = 0,
        max_tokens = 2096
    )
    return response.choices[0].text.lstrip()

def main(argv):
    filename = argv[0]
    contents = read_file(filename)
    prompt = build_prompt(contents)
    fixed_content = send_to_openai(prompt)
    write_file(filename, fixed_content)

if __name__ == "__main__":
   main(sys.argv[1:])

commit_merge_push = subprocess.call('./generate_mr.sh')
print(commit_merge_push)