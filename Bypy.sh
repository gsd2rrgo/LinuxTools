cd /home/baiduupload
UpFile=*
if [ "${UpFile}" == "*" ]
then
    # 獲取文件名
    cd /home/baidu
    FileNames=*
    if [ "${FileNames}" != "*" ]
    then
        for line in $(cat /home/UpLoadList.txt)
        do 
            for Name in $FileNames
            do
                if [ "${line}" != "$Name" ]
                then
                    # 打包
                    tar cvf "${Name}.tar" ${Name}
                    echo "${Name}" >> /home/UpLoadList.txt
                    # 移動
                    mv -f "/home/baidu/${Name}.tar" "/home/baiduupload/${Name}.tar"
                fi
            done
        done
        
        # 上傳
        cd /home/baiduupload
        bypy upload

        rm -rf /home/baiduupload/*
    fi
fi

