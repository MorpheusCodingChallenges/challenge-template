In den meisten Challenges geht es nicht nur darum, ein Programm zu schreiben, das zu einem gegebenen Input einen bestimmten Output produziert, sondern auch darum, dieses Programm möglichst effizient zu machen. Für die Ausführung des Programms steht nur eine begrenzte Zeit zur Verfügung (siehe unten). Ist das Programm nach Ablauf dieses Zeit-Limits (in dieser Einführungschallenge eine Sekunde) nicht fertig, gilt der entsprechende Testfall und damit die Teilaufgabe als durchgefallen.

In dieser Challenge ist die Aufgabe, für eine gegebene natürliche Zahl $n$, die Summe der ersten $n$ natürlichen Zahlen zu berechnen. Eine mögliche Lösung dafür ist, über die ersten $n$ natürlichen Zahlen zu iterieren und diese dabei zu addieren. Die Laufzeit dieser Lösung ist allerdings proportional zu $n$, was in der zweiten Teilaufgabe problematisch wird, da bis zu einer Trilliarde Zahlen addiert werden müssten, was extrem lange dauern würde. Eine bessere Lösung wäre hier zum Beispiel die [Gaußsche Summenformel](https://de.wikipedia.org/wiki/Gau%C3%9Fsche_Summenformel) $\sum_{k=1}^n k = \frac{n(n+1)}2$, mit der sich die Summe der ersten $n$ natürlichen Zahlen in konstanter Zeit berechnen lässt.

**Eingabe:**
- Zeile 1: Die Zahl $n$

**Ausgabe:**
- Zeile 1: Die Summe der ersten $n$ natürlichen Zahlen $\sum_{k=1}^n k$

***

In most challenges, the goal is not only to write a program that produces a certain output for a given input, but also to make this program as efficient as possible. Only a limited time is available for the execution of the program (see below). If the program is not finished after this time limit (in this introduction challenge one second), the corresponding test case and thus the subtask is considered as failed.

In this challenge, the task is to calculate the sum of the first $n$ natural numbers for a given natural number $n$. A possible solution for this is to iterate over the first $n$ natural numbers, adding them together. However, the execution time of this solution is proportional to $n$, which becomes problematic in the second sub-task, since up to a sextillion numbers would have to be added, which would take an extremely long time. A better solution here would be, for example, the [Gaussian summation formula](https://de.wikipedia.org/wiki/Gau%C3%9Fsche_Summenformel) $\sum_{k=1}^n k = \frac{n(n+1)}2$, which can be used to calculate the sum of the first $n$ natural numbers in constant time.

**Input:**
- Line 1: The number $n$

**Output:**
- Line 1: The sum of the first $n$ natural numbers $\sum_{k=1}^n k$
