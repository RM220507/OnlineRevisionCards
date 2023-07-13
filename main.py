import random

all_questions = {
  "Chemistry Ions":[
    {"Q":"Hydrogen Ions", "A":"H+"},
    {"Q":"Group 1 Metals", "A":"1+"},
    {"Q":"Group 2 Metals", "A":"2+"},
    {"Q":"Group 3 Metals", "A":"3+"},
    {"Q":"Ammonium Ions", "A":"NH4^+"},
    {"Q":"Silver Ions", "A":"Ag+"},
    {"Q":"Zinc Ions", "A":"Zn^2+"},
    {"Q":"Lead Ions", "A":"Pb^2+"},
    {"Q":"Group 5 Non-Metals", "A":"3-"},
    {"Q":"Group 6 Non-Metals", "A":"2-"},
    {"Q":"Group 7 Non-Metals", "A":"1-"},
    {"Q":"Hydroxide Ions", "A":"OH-"},
    {"Q":"Carbonate Ions", "A":"CO3^2-"},
    {"Q":"Sulfate Ions", "A":"SO4^2-"},
    {"Q":"Nitrate Ions", "A":"NO3^-"}]
}

questions = {}
question_element = Element("question")
count = 0


def load_new():
    global questions
    question_name = input()
    try:
        questions = all_questions[question_name]
        random.shuffle(questions)
        Element("question_name").element.innerText = question_name
        count = 0
        reload()
    except:
        print("File not Available")

def show_answer():
    if count < len(questions):
        question_element.element.innerText = questions[count]["A"]

def previous_question():
    global count
    count -= 1
    reload()

def next_question():
    global count
    count += 1
    reload()

def reload():
    global count
    if 0 <= count < len(questions):
        question_element.element.innerText = questions[count]["Q"]
    else:
        count = 0
        reload()
