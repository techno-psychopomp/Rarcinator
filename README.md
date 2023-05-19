# Rarcinator

Rarcinator is a Python application that utilizes OpenAI to automatically correct grammar and spelling errors in your repository files. It provides a convenient way to enhance the clarity and correctness of your codebase and documentation.

## Features

- Grammar Correction: Rarcinator leverages OpenAI's powerful language model to identify and fix grammatical errors in your code and documentation.
- Spelling Correction: Is utilizes OpenAI's language model to detect and correct spelling mistakes in your repository files.
- Language Support: It supports various programming languages and file formats, ensuring that all parts of your codebase are thoroughly checked.


## Getting Started

To start using Rarcinator, follow the instructions below:

1. Clone the repository to your local machine.
2. Set up an environment variable and reference to it in `rarcinatorpy` (I used `OPENAI_API_KEY'` in this example so replace if needed)
3.Replace `your-repository`, `your-branch`, `your-access-token`, `your-username` in generate_mr.sh with your Github information.
4. Run the script on the file you want to check for grammar/spelling```# run the script on a HTML file
 python rarcinator.py index.html
```


## RoadMap
- Support for multiple files: Be able to scan the hole repository or a selection of files.
- Automated Processing: The application scans your repository files and suggests corrections for grammar and spelling errors automatically.
