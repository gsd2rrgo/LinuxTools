cd /home/baiduupload
echo "Chack..."
UpFile=$(ls)
if [ "${UpFile}" == "" ]
then
    echo "Start..."
    # 獲取文件名
    cd /home/baidu
    FileNames=*
    FileCheck=$(ls)
    if [ "${FileCheck}" != "" ]
    then
        for Name in ${FileNames}
        do
            flag=""
            for line in $(cat /home/UpLoadList.txt)
            do 
                if [ "${line}" == "${Name}" ]
                then
                    flag="HAS"
                fi
            done
            if [ "${flag}" != "HAS" ]
            then
                    echo "打包..."
                    # 打包
                    zip -s 4000m -r "${Name}.zip" "${Name}/"
                    echo "輸出..."
                    echo "${Name}" >> /home/UpLoadList.txt
                    echo "移動..."
                    # 移動
                    mv -f "/home/baidu/${Name}".z* "/home/baiduupload/"
            fi
        done
        echo "Upload..."
        # 上傳
        cd /home/baiduupload
        bypy upload
        echo "Upload...End"
    fi
fi
echo "Done..."
