OS_NAME, _ = os.execute("uname")
OS_CTRL_KEY = OS_NAME == "Linux" and "D" or "C"

require("chato.remap")
require("chato.packer")
require("chato.custom-sets")
require("chato.autoformat")
