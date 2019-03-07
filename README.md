# isgd.sh
Bash cli URL shortener

Command-line tool to shorten URLs using the excellent [is.gd](https://is.gd) [URL shortener](https://en.wikipedia.org/wiki/URL_shortening).

This tool is [free software](https://en.wikipedia.org/w/index.php?title=Free_software&oldid=695656324#Definition_and_the_Four_Freedoms) under the [GNU Affero General Public License, version 3](https://www.gnu.org/licenses/agpl-3.0.html).

Assuming GNU/Linux with the `apt-get` command installed and working, GNU Bash as your shell, and installation rights available using `sudo`, you can install `isgd` as follows:

    sudo apt-get install curl
    mkdir -p ~/bin
    curl 'https://raw.githubusercontent.com/xearonet/isgd.sh/master/isgd.sh' > ~/bin/isgd
    chmod +x ~/bin/isgd
    echo -e '\n# Add ~/bin to PATH\nexport PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

You can now run isgd.sh by entering `isgd` followed by the URL you want to shorten.  
**Put the URL in single quotes**. The tool will return a shortened URL.
For example:

    $ isgd 'example.com'
    https://is.gd/RaZxUe

An example using a longer URL:

    $ isgd 'https://en.wikipedia.org/w/index.php?title=CURL&action=history'
    https://is.gd/35qysF

Tool has some [usage limits](https://is.gd/usagelimits.php)

N.B. This tool uses the is.gd API, and is therefore subject to that API's [restrictions/limitations](https://is.gd/apishorteningreference.php#restrict).
