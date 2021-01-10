#!/usr/bin/env python3

import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, debug=True, reload=True)

app = FastAPI()


class Person(BaseModel):
    name: str
    age: int


db = [
    Person(name="Tory", age=32),
    Person(name="Alex", age=35),
]


@app.get("/persons/{name}")
async def read_person(name: str) -> Person:
    for person in db:
        if person.name == name:
            return person
