new_view <- function(data = data) {
  KeyboardSimulator::keybd.press('ctrl', hold = TRUE)
  KeyboardSimulator::keybd.press('f7', hold = FALSE)
  KeyboardSimulator::keybd.release('ctrl')
  View(data)
}
