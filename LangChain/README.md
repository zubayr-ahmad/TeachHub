# LangChain with Gemini — A Practical Course

A hands-on course that teaches **LangChain 1.0** using Google's **Gemini** models.
It assumes you are already comfortable with Python and object-oriented programming;
it does not re-teach those. Instead it focuses on the ideas and building blocks you
need to assemble real LLM applications: chat models, prompts, structured output,
composition (LCEL), memory, retrieval (RAG), and agents.

Every notebook follows the same rhythm: a short explanation of *why* a piece exists,
a minimal working example, then progressively realistic ones, and a few
**"Your turn"** exercises with collapsible solutions.

## Prerequisites

- Python 3.10+ and comfort with classes, functions, and typing
- A **Gemini API key** (free tier is enough for this course) from
  [Google AI Studio](https://aistudio.google.com/app/apikey)

## Setup (once)

1. Install the dependencies into your environment:

   ```bash
   pip install -r requirements.txt
   ```

2. Copy `.env.example` to `.env` and paste your key:

   ```
   GOOGLE_API_KEY=your-gemini-api-key-here
   ```

3. Open any notebook and select a Python kernel that has the packages installed.
   These notebooks are tagged with the `numpy-ml` kernel (the conda `ml` env, which
   already has the full stack). If you use a different environment, just pick its
   kernel from the kernel selector — the code is identical.

The first code cell of every notebook loads your key from `.env`, so you only set
it up once.

> The notebooks ship **without saved outputs** on purpose — LLM calls need your live
> key and the responses are non-deterministic. Run the cells top to bottom to see
> results for yourself.

## Course outline

| # | Notebook | What you'll learn |
|---|----------|-------------------|
| 01 | [Introduction & Setup](01_Introduction_and_Setup.ipynb) | What LangChain is and isn't, the package ecosystem, getting a key working, your first Gemini call |
| 02 | [Chat Models with Gemini](02_Chat_Models_with_Gemini.ipynb) | Messages (system/human/ai), model parameters, streaming, batching, token usage |
| 03 | [Prompt Templates](03_Prompt_Templates.ipynb) | Reusable prompts, chat prompt templates, message placeholders, few-shot prompting |
| 04 | [Output Parsers & Structured Output](04_Output_Parsers_and_Structured_Output.ipynb) | Getting clean strings, JSON, and validated Pydantic objects back from the model |
| 05 | [LCEL & Runnables](05_LCEL_and_Runnables.ipynb) | The `\|` pipe operator, parallel/passthrough/lambda runnables, composing chains |
| 06 | [Memory & Conversation](06_Memory_and_Conversation.ipynb) | Conversation history, trimming context, building a multi-turn chatbot |
| 07 | [Document Loaders & Text Splitters](07_Document_Loaders_and_Text_Splitters.ipynb) | Loading text/PDF/web data and chunking it well for retrieval |
| 08 | [Embeddings & Vector Stores](08_Embeddings_and_Vector_Stores.ipynb) | Gemini embeddings, semantic similarity, vector stores, retrievers |
| 09 | [Retrieval-Augmented Generation](09_Retrieval_Augmented_Generation.ipynb) | Build a RAG pipeline that answers questions from your own documents, with sources |
| 10 | [Tools & Agents](10_Tools_and_Agents.ipynb) | Defining tools, tool calling, and building agents with `create_agent` |
| 11 | [Capstone Project](11_Capstone_Project.ipynb) | A complete document-Q&A assistant that combines RAG, tools, and memory |

Work through them in order — each builds on the previous one.

## A note on versions

LangChain moves fast. This course targets the **1.0** line:

- `langchain`, `langchain-core` ≥ 1.0
- `langchain-google-genai` ≥ 2.1
- `langgraph` ≥ 1.0 (LangChain 1.0 agents are built on it)

If an import path ever changes in a future release, the concept still applies — check
the official docs at <https://docs.langchain.com> for the current location.
