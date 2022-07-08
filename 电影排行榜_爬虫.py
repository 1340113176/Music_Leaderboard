import time
import requests
from lxml import etree
import pymysql

#加载mysql数据库
conn=pymysql.connect(host='localhost',
                    user='root',#用户名
                    passwd='root',#密码
                    port=3306,#端口号
                    charset='utf8')
cursor=conn.cursor()
print("连接数据库成功!")
#删除数据库
deleteshujuku='''drop database if exists movie'''
cursor.execute(deleteshujuku)
#创建数据库
CreateShuJuKu='''create database if not exists movie'''
cursor.execute(CreateShuJuKu)
cursor.execute("use movie")
#创建数据表
CreateShuJubiao='''create table if not exists 豆瓣电影top250 (
        排名 int auto_increment primary key,
        电影名 varchar(100),      
        导演 varchar(100),
        主演 varchar(200),
        类别 varchar(50),
        国家 varchar(100),
        上映时间 varchar(50),
        评分 varchar(20));
        '''
cursor.execute(CreateShuJubiao)
CreateShuJubiao='''create table if not exists 猫眼电影top100(
        排名 int auto_increment primary key,
        电影名 varchar(100),
        主演 varchar(200),
        上映时间 varchar(50),
        评分 varchar(20));
        '''
cursor.execute(CreateShuJubiao)
CreateShuJubiao='''create table if not exists 爱奇艺热播榜_电影(
        排名 int auto_increment primary key,
        电影名 varchar(100),
        简介 varchar(200),
        评分 varchar(20),
        热度 varchar(20));
        '''
cursor.execute(CreateShuJubiao)
CreateShuJubiao='''create table if not exists 腾讯_高分好评榜_电影top30(
        排名 int auto_increment primary key,
        电影名 varchar(100),
        主演 varchar(200),
        观看量 varchar(100),
        时长 varchar(50),
        评分 varchar(20));
        '''
cursor.execute(CreateShuJubiao)
CreateShuJubiao='''create table if not exists 乐视_热播榜_电影top30(
        排名 int auto_increment primary key,
        电影名 varchar(100),
        简介 varchar(200),
        评分 varchar(20));
        '''
cursor.execute(CreateShuJubiao)
#清空表中的数据
cursor.execute("truncate table 豆瓣电影top250")
#cursor.execute("truncate table 猫眼电影top100")
cursor.execute("truncate table 爱奇艺热播榜_电影")
cursor.execute("truncate table 腾讯_高分好评榜_电影top30")
cursor.execute("truncate table 乐视_热播榜_电影top30")

#请求头
headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'}
#豆瓣电影top250
def get_douban(url_1):
    try:
        res=requests.get(url_1,headers=headers)
        sector=etree.HTML(res.text)
        infos=sector.xpath("//*[@id='content']/div/div[1]/ol/li")
        for info in infos:
            电影名=info.xpath("div/div[2]/div[1]/a/span[1]/text()")[0]
            上映时间=info.xpath("div/div[2]/div[2]/p[1]/text()")[1].strip().split("\xa0/\xa0")[0]+"年"
            导演=info.xpath("div/div[2]/div[2]/p[1]/text()")[0].strip().split("\xa0\xa0\xa0")[0].split(":")[1] 
            评分=info.xpath("div/div[2]/div[2]/div/span[2]/text()")[0]
            国家=info.xpath("div/div[2]/div[2]/p[1]/text()")[1].strip().split("\xa0/\xa0")[1]
            类别=info.xpath("div/div[2]/div[2]/p[1]/text()")[1].strip().split("\xa0/\xa0")[2]
            try:
                主演=info.xpath("div/div[2]/div[2]/p[1]/text()")[0].split("\xa0\xa0\xa0")[1].strip().split(":")[1]
            except:
                主演="这部电影格式错误(豆瓣)"             
            cursor.execute("insert into 豆瓣电影top250 (电影名,导演,主演,类别,国家,上映时间,评分) values "
                        "(%s,%s,%s,%s,%s,%s,%s)",(电影名,导演,主演,类别,国家,上映时间,评分))
    except:
        print("‘豆瓣电影top250’出现错误!")
    
#猫眼电影top100
def get_maoyan(url_2):
    try:
        res=requests.get(url_2,headers=headers)
        sector=etree.HTML(res.text)
        infos=sector.xpath("//*[@id='app']/div/div/div[1]/dl/dd")
        for info in infos:
            电影名=info.xpath("div/div/div[1]/p[1]/a/text()")[0]
            主演=info.xpath("div/div/div[1]/p[2]/text()")[0].strip().replace("\n", "").split("：")[1]
            上映时间=info.xpath("div/div/div[1]/p[3]/text()")[0].split("：")[1]
            评分=info.xpath("div/div/div[2]/p/i/text()")[0]+info.xpath("div/div/div[2]/p/i/text()")[1]
            cursor.execute("insert into 猫眼电影top100 (电影名,主演,上映时间,评分) values "
                        "(%s,%s,%s,%s)",(str(电影名),str(主演),str(上映时间),评分))
    except:
        print("‘猫眼电影top100’出现错误!")

#爱奇艺热播榜_电影
def get_aiqiyi_1(url_3_1):
    try:
        res=requests.get(url_3_1,headers=headers)
        sector=etree.HTML(res.text)
        infos=sector.xpath("//*[@id='__layout']/div/div[3]/div[2]/div[2]/div[2]/div")
        for info in infos:
            电影名=info.xpath("div/div[1]/div/a/div[2]/div/h3/div/text()")
            简介=info.xpath("div/div[1]/div/a/div[2]/div/div/p/text()")
            评分=info.xpath("div/div[1]/div/a/div[1]/div[2]/div/span/text()")
            热度=info.xpath("div/div[1]/div/a/div[2]/div/div/div/span/text()")        
            cursor.execute("insert into 爱奇艺热播榜_电影 (电影名,简介,评分,热度) values "
                            "(%s,%s,%s,%s)",(str(电影名),str(简介),str(评分),str(热度)))
    except:
        print("‘爱奇艺热播榜_电影_1’出现错误!")
def get_aiqiyi_2(url_3_2):
    try:
        resp = requests.get(url_3_2, headers=headers)
        resp_json = resp.json()
        movieList = resp_json['data']['formatData']['list']
        movie_list = []
        dit = {}
        for movie in movieList:
            dit['电影名'] = movie['name']
            dit['简介'] = movie['description']
            dit['热度'] = movie['hotIndex']
            dit['评分'] = movie['score']
            movie_list.append(dit.copy())
            cursor.execute("insert into 爱奇艺热播榜_电影 (电影名,简介,评分,热度) values (%s,%s,%s,%s)",(dit['电影名'],dit['简介'],dit['评分'],dit['热度']))
    except:
        print("‘爱奇艺热播榜_电影_2’出现错误!")
#腾讯_高分好评榜_电影top30
def get_tengxun(url_4):
    try:
        res = requests.get(url_4, headers=headers)
        res.encoding = 'utf8'
        sector=etree.HTML(res.text)
        infos=sector.xpath("/html/body/div[5]/div/div[2]/div")
        for info in infos:
            电影名=info.xpath("div[1]/a/text()")[0].strip()
            try:
                主演=info.xpath("div[1]/div/text()")[0].strip().split("：")[1]
            except:
                主演="这部电影格式有问题"
            评分=info.xpath("a/div[2]/text()")[0].strip()
            时长=info.xpath("a/div[1]/text()")[0].strip()
            观看量=info.xpath("div[2]/text()")[0].strip()
            cursor.execute("insert into 腾讯_高分好评榜_电影top30 (电影名,主演,观看量,时长,评分) values "
                            "(%s,%s,%s,%s,%s)",(电影名,主演,观看量,时长,评分))
    except:
        print("‘腾讯_高分好评榜_电影top30’出现错误!")
#乐视_热播榜_电影top30
def get_leshi(url_5):
    try:
        res = requests.get(url_5, headers=headers)
        res.encoding = 'utf8'
        sector=etree.HTML(res.text)
        infos=sector.xpath("/html/body/div[3]/div/div[2]/dl")
        for info in infos:
            电影名=info.xpath("dt/a/text()")[0].strip()
            简介=info.xpath("dd[2]/text()")[0].strip()
            评分=info.xpath("dd[1]/a/span/text()")[0].strip()
            cursor.execute("insert into 乐视_热播榜_电影top30 (电影名,简介,评分) values "
                            "(%s,%s,%s)",(电影名,简介,评分))
    except:
        print("‘乐视_热播榜_电影top30’出现错误!")


if __name__ == "__main__":
    print("本程序将爬取“豆瓣电影top250”、“猫眼电影top100”、“爱奇艺热播榜_电影top50”、"
    "“腾讯_高分好评榜_电影top30”、“乐视_热播榜_电影top30”")
    time.sleep(5)
    print("\n----------------豆瓣电影网top250-----------------")
    for i in range(11):
        url_1="https://movie.douban.com/top250?start={}&filter=".format(i*25)
        get_douban(url_1)
        time.sleep(1)
        print("第 ",i+1," 页已爬完")

    print("\n-----------------猫眼电影top100------------------")
    for j in range(10):
        url_2="https://maoyan.com/board/4?offset={}".format(j*10)
        get_maoyan(url_2)
        time.sleep(1)
        print("第 ",j+1," 页已爬完")

    print("\n----------------爱奇艺热播榜_电影top50------------")
    url_3_1="https://www.iqiyi.com/ranks/hotplay/movie"
    get_aiqiyi_1(url_3_1)
    print("第 1 页已爬完")
    url_3_2="https://pcw-api.iqiyi.com/strategy/pcw/data/topReboBlock?cid=1&dim=hour&type=realTime&len=25&pageNumber=2"
    get_aiqiyi_2(url_3_2)
    time.sleep(1)
    print("第 2 页已爬完")

    print("\n--------------腾讯_高分好评榜_电影top30------------")
    url_4="https://v.qq.com/channel/movie?_all=1&channel=movie&listpage=1&sort=21"
    get_tengxun(url_4)
    time.sleep(1)
    print("已爬完")

    print("\n---------------乐视_热播榜_电影top30---------------")
    url_5="http://list.le.com/listn/c1_t-1_a-1_y-1_s1_lg-1_ph-1_md_o9_d1_p.html"
    get_leshi(url_5)
    time.sleep(1)
    print("已爬完")
    print("\n---------------------------------------------------\n")


    conn.commit()
    conn.close()

print("\n已全部爬完,并且保存到mysql数据库(movie)中\n")