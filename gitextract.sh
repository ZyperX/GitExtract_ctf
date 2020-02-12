#!/bin/bash
banner_ext ()
 { echo -e "\e[91m######################################################";
echo -e "\e[34m                     Git-Extractor            ";
echo -e "                  * Coded by \e[5mZyperX\e[0m\e[34m  *\e[0m               ";
echo -e "\e[91m######################################################" ;
echo -e "\e[0m";
 }
banner_fet ()
 { echo -e "\e[91m######################################################";
echo -e "\e[34m                     Git-Fetcher            ";
echo -e "                  * Coded by \e[5mZyperX\e[0m\e[34m  *\e[0m               ";
echo -e "\e[91m######################################################" ;
echo -e "\e[0m";
 }
if [ $# -lt 2 ]
 then
    banner_ext
    echo -e "\e[34m[+]      Git Extraction        \e[0m  "
    echo "[-]Syntax : ./gitextract.sh url [url]"
    echo "[-]Example: ./gitextract.sh url https://example.com/"
    echo ""
    echo ""
    echo -e "\e[34m[+]      Object Fetcher         \e[0m"
    echo "[-]Syntax : ./gitextract.sh fetch [url]"
    echo "[-]Example: ./gitextract.sh fetch https://example.com/"  
elif [ $1 == "url" ]
     then
     banner_ext
     mkdir -p .git;
     cd .git;
     mkdir -p {hooks,info,objects/{info,pack},refs/{heads,tags}};
     for file in HEAD config description info/exclude refs/heads/master; do
        curl --silent ""$2"/.git/${file}" > "${file}" 
            if [ -e ""$file"" ]
                then
                  echo "[+]Extracted $file ......"
            else
                   echo "[-]Extraction $file failed...."
            fi
      done;
      cd ..
      if [ -e ".git/HEAD" ]
        then
        echo -e "\e[91m[*]Extraction Successfull !!"
        echo "[*]Check .git directory."
      else
        echo "[-]Extraction Failed !!"
       fi
elif [ $1 == "fetch" ]
 then
   banner_fet
   read -p "[+]Enter object hash:" hash
   object=$hash;
   dir="${object:0:2}";
   file="${object:2:38}";
   mkdir -p ".git/objects/${dir}";
   path=".git/objects/${dir}/${file}";
   curl -s ""$2""$path"" > $path ;
   echo "[+]Path :"$path""
   if [ -e ""$path"" ]
    then
    echo -e "\e[91m[*]Object Downloaded !!"
   else
    echo "[-]Object Download fail !!"
   fi
fi

