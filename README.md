# bat-gen-binpatch
Generates a differential binary patcher linux style for Windows.

This script generates a binary patch and a script that applies the patch as well. This is perfect for gamemods and even cracks.

* Uses MD5 for checksum verification
* Uses DIFF to differentiate
* Uses PATCH to apply differences

### Usage: gen-binpatch.bat originalfile patchedfile:
* originalfile: the file that is expected for the patch
* patchedfile: the file that will be differentially compared with the original, changes are stored in **"data.patch"**.

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/gen-binpatcher_v2_diff_ok.png)

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/gen-binpatcher_v2_diff_error.png)

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/gen-binpatcher_v2_apply_screen01.png)

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/gen-binpatcher_v2_apply_screen02.png)
