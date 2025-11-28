# Children Learning App – Assembly 8086 

This project is an educational learning application written in **8086 Assembly**, designed to teach children basic **English alphabets (A–Z)** and **numbers (0–9)**. The program displays a corresponding word for every entered letter or digit, making it a simple and interactive learning tool suitable for pre-school students.

---

## ✨ Features
- Intro screen with project title and instructions.
- Main menu:
  - **1** → Enter Study Mode  
  - **\*** → Exit the program
- Letter learning:
  - Supports uppercase and lowercase letters (A–Z / a–z).
  - Displays an educational word for each letter (e.g., A → Apple, B → Ball).
- Number learning:
  - Displays the English word for digits 0–9 (e.g., 0 → ZERO, 9 → NINE).
- Input validation: shows **INVALID INPUT** for unsupported characters.
- Uses DOS **INT 21h** interrupt for console I/O.
- Compatible with EMU8086, DOSBox, TASM, and MASM.

---

## 📂 Project Structure
```
alphabet.asm      # Main source code (Assembly)
EMU8086.INC       # EMU8086 macro definitions (included file)
README.md         # Project documentation (this file)
```

---

## 🛠 Requirements
Install one of the following to assemble and run the program:
- **EMU8086** (recommended for learning and easy testing)  
- **DOSBox + TASM 4.1**  
- **MASM**

---

## ▶️ How to Assemble & Run

### Using TASM (DOSBox or native DOS environment):
```bash
tasm alphabet.asm
tlink alphabet.obj
alphabet.exe
```

### Using EMU8086:
1. Open EMU8086.  
2. Load `alphabet.asm`.  
3. Click **Assemble** → **Run**.

---

## 🎮 Usage Instructions
1. Run the program.  
2. Press any key to continue from the intro screen.  
3. At the menu, choose:
   - **1** → Study Mode  
   - **\*** → Exit
4. In Study Mode, type a letter (A–Z or a–z) or a digit (0–9). The program prints the corresponding word.  
5. To exit at any time, press **\***.

Example:
- Input: `A` → Output: ` for Apple`
- Input: `5` → Output: ` FIVE`

---

## 👤 Author
**Muhammad Waleed Muhammed Abd Alhay**

**Muhammad Yasser Ahmed Mosa**

**Mahmoud Adel Radwan**


---

## 📄 License
This project is provided for educational and academic use.

---

If you want this README converted to `README.md` at the project root or combined with the first README, I can do that too.
