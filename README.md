# DJHFontManager
    Change the font for all UILabel, UIButton, UITextView and UITextfield
    with passing your font

# Install

    Add `pod 'DJHFontManager'`
    Run `pod 'install`


# How To Use 

    In your AppDelegate
    Change the font name to your font family or keep it empty to use the current font
    let fontConfig = DJHFontManager.DJHFotnConfigration.init(reqular: "Change to Reqular Font Name",
                                                                    bold: "Change to Bold Font Name",
                                                                    light: "Change to Light Font Name",
                                                                    italic: "Change to Italic Font Name",
                                                                    black: "Change to Black Font Name")
            //Activate
            DJHFontManager.shared.activate(config: fontConfig)
`


# Author 

    * LinkedIn : [dhamza](https://www.linkedin.com/in/dhamza/)
    * Website: http://dhamza.com
 

# MIT License

    Copyright (c) 2018 Diyaa Hamza

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
