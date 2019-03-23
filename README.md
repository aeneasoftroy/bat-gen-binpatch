# bat-gen-binpatch
Generates a differential binary patcher linux style for Windows.

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/blob/master/gen-binpatcher_v2_diff_ok.png)

*Screenshot of a completed differential binary patch generation*

This script generates a binary patch and a script that applies the patch as well. This is perfect for gamemods and even cracks.

* Uses MD5 for checksum verification
* Uses DIFF to differentiate
* Uses PATCH to apply differences

### Usage: gen-binpatch.bat originalfile patchedfile:
* originalfile: the file that is expected for the patch
* patchedfile: the file that will be differentially compared with the original, changes are stored in **"data.patch"**.

### Patch creation steps:
* modify the bat file, change your releaser name
* execute "script.bat originalfile patchedfile"
* input release name
* script will validate the original file using MD5
* script will differentiate data
* script will gather patch details
* script will generate a new script for applying the patchdata including details of the patch
* script will generate a NFO file with details of the patch
* script will create a directory with the release name

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/blob/master/gen-binpatcher_v2_diff_error.png)

*Screenshot of a failed differential binary patch generation*

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/blob/master/gen-binpatcher_v2_apply_screen01.png)

*Screenshot of the Welcome screen of the generated output script*

![alt text](https://github.com/aeneasoftroy/bat-gen-binpatch/blob/master/gen-binpatcher_v2_apply_screen02.png)

*Screenshot of the patching process of the generated output script*
