# 1. Primitives, Values, Operators and the REPL

## Sources

- [Elm Guide: Core language concepts](https://guide.elm-lang.org/core_language.html)

## DIY

Run the following lines in the Elm REPL.
You can start the REPL with `elm repl`.

> Note: not all examples work. Learning from the error messages is key for these examples.

#### Comparison

```
("A" == "A")
("A" == 'a')
```

#### Strings & Chars

```
"Hello " + "World"
'A' ++ "BC"
String.fromChar 'A' ++ "BC"
```

#### Basic Arithmetic

```
1 + 2
4 * 3
20 / 6
20 // 6
20.1 // 6
2 - 1
2  -1
```

#### Function Invocation

```
String.fromInt 1234
String.reverse <| String.fromInt 1234
String.reverse <| String.fromInt <| 1234
1234 |> String.fromInt |> String.reverse
```

#### Definitions

```
first = 1
second = 2
total = first + second
(total == 3)
first = 5
(total == 3)
```

#### Lists

```
[ 1 , 2 ] ++ [ 3, 4, 5]
1 ++ [ 2, 3]
```

#### Boolean Logic

```
True || False
True || True && False
False && True || True
```

#### Records

```
person = { name = "John", age = 20 }
person.name
person.age
person.nom
person2 = { person | name = "Pete"}
(person == person2)
```

## What you should know afterwards

- How to start, use and read the REPL;
- What the difference is between `String` and `Char`;
- What difference is between `Int` and `Float`;
- When things are written with a capital or not;
- Some basic operators;
- How to construct a `List`;
- How to create structured data.
