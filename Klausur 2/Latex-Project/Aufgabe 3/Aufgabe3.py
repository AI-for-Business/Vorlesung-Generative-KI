# Importing required libraries
from langchain.chat_models import ChatOpenAI
from langchain.prompts import ChatPromptTemplate
from langchain.chains import LLMChain
from langchain.chains import SimpleSequentialChain
from langchain.chains import SequentialChain
from langchain.chains import RouterChain

product_idea = ""  # Will later be given as input by the user

# Instantiate the chosen Large Language Model
llm = ChatOpenAI(temperature=0.6, model="gpt-4.o")

prompt_1 = ChatPromptTemplate.from_template("Create a product name for the following product idea: {idea}")
chain_1 = LLMChain(llm=llm, prompt=prompt_1)

prompt_2 = ChatPromptTemplate.from_template("Write a short claim for the following product name: {name}")
chain_2 = LLMChain(llm=llm, prompt=prompt_2)

prompt_3 = ChatPromptTemplate.from_template("Suggest a fitting color scheme for {product} that aligns with our corporate identity.")
chain_3 = LLMChain(llm=llm, prompt=prompt_3)

prompt_4 = ChatPromptTemplate.from_template("Generate a short ad text for a product based on the claim: {claim}")
chain_4 = LLMChain(llm=llm, prompt=prompt_4)

prompt_5 = ChatPromptTemplate.from_template("Extend the given short ad text to a larger text illustrating our newest product: {short_text}")
chain_5 = LLMChain(llm=llm, prompt=prompt_5)

llm_application = SimpleSequentialChain(chains=[chain_1, chain_2, chain_4, chain_5])
llm_application.run(product_idea)






x = SequentialChain()
y = RouterChain
