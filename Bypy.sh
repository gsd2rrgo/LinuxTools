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
        for line in $(cat /home/UpLoadList.txt)
        do 
            for Name in $FileNames
            do
                if [ "${line}" != "$Name" ]
                then
                    echo "打包..."
                    # 打包
                    tar cvf "${Name}.tar" ${Name}
                    echo "輸出..."
                    echo "${Name}" >> /home/UpLoadList.txt
                    echo "移動..."
                    # 移動
                    mv -f "/home/baidu/${Name}.tar" "/home/baiduupload/${Name}.tar"
                fi
            done
        done
        echo "Upload..."
        # 上傳
        cd /home/baiduupload
        bypy upload

        rm -rf /home/baiduupload/*
    fi
fi
echo "Done..."
