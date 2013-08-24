kindle-fmt
======

A simple ruby script which tries to properly format code blocks copied from the Kindle for Mac application. I was
[ramping up on android](http://www.amazon.com/Android-Programming-Ranch-Guide-Guides/dp/0321804333/ref=sr_1_1?ie=UTF8&qid=1377372660&sr=8-1&keywords=android+programming) using a Kindle book and realized the app does a terrible job of copy/pasting contents to an IDE/text
editor. This script reads the contents of your clipboard and applies some basic formatting logic then replaces the contents
of your clipboard with (somewhat) better formatted code. Not perfect, but made my life a little easier.

### Usage
1- Install clipboard gem:
> gem install clipboard

2- Go to your Kindle app copy a block of code (only xml and java supported for now)
<center><img src="/help/1_copy.png" height="200px"/></center>

3- Run the kindle_fmt script from your terminal.
> ./kindle_fmt

4- The contents of your clipboard should contain newly formatted code.
<table border="1" height="300px">
<tr>
<th>Before</th>
<th>After</th>
</tr>
<tr>
<td width="50%"><center><img src="/help/3_bad.png" /></center></td>
<td width="50%"><center><img src="/help/2_paste.png" /></center></td>
</tr>
</table>

Script will try to detect if you're pasting xml or java. You can explicitly tell the script how to treat the text. Ex:
> ./kindle_fmt xml

OR

> ./kindle_fmt java

### Tips
- To make your life easier, add the git repo folder to your path so you can run this from anywhere:
(In ~/.bashrc or ~/.zshrc)
> export PATH=$PATH:/path/to/kindle_fmt

- You could probably bind this script to a hotkey combo to make life even easier. Kind of annoying having to go to the
terminal to apply formatting.

### TODO
- Get Amazon to fix formatting int heir app. Its turrrrible.
- Add support for more languages

