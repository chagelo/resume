#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let gpa1 = 3.56
    let psu-date = [#translate-date(9, 2021) -- #current]
    translate(
      zh: cventry(
        tl: [中国科学与技术大学，计算机科学与技术，硕士],
        tr: psu-date,
      )[导师：S. Kevin Zhou, GPA #gpa1/4.10]
    )

    let gpa2 = 4.10
    let cmu-date = [#translate-date(9, 2017) -- #translate-date(6, 2021)]
    translate(
      zh: cventry(
        tl: [常州大学，计算机科学与技术，本科],
        tr: cmu-date,
      )[GPA #gpa2/5.00],
    )
  }

  let cmu15445 = {
    translate(
      zh: cventry(
        tl: [*CMU15-445*，面向磁盘的单机关系型数据库],
        tr: githublink("chagelo/bustub-database"),
      )[
      - 内存：基于 LRU-K 页面替换策略设计 Buffer Pool
      - 索引：基于 B+ 树，实现非聚簇索引，利用每个节点独立的读写锁兼顾了多线程并发访问的安全性和效率，支持通过迭代器对数据进行基于关键字的范围查找
      - 执行器：采用火山模型，实现了多种语句的执行器，如 Aggregate、Group By、TopN 等
      - 优化器：进行了简单的优化，将 NestedLoopJoin 优化为 HashJoin
      - 并发控制：基于 2PL 设计 LockManager，支持 RR, RC, RU 三种事务隔离级别和表、行两种粒度的五种锁类型，实现死锁的检测和解除
      ],
    )
  }

  let bitcask = {
    translate(
      zh: cventry(
        tl: [*bitcask*，基于 GO 实现的 bitcask 存储引擎。],
        tr: githublink("chagelo/bitcask-go"),
      )[
        - 磁盘：将标准文件操作 API 进行简单封装，使用 hintfile 提高加载索引速度，通过 mmap 提高读取数据效率
        - 索引：支持 B 树，ART，B+ 树三种索引结构
        - 文件 merge：通过文件 merge 对无效数据进行清理，定期 merge 节省磁盘空间，提高数据库启动时加载速度
        - 事务：实现了串行化的事务，满足 ACID 特性
      ],
    )
  }

  let mabs = {
    translate(
      zh: cventry(
        tl: [*MABS*，基于扩散模型的核磁图像去运动伪影。],
        tr: githublink("chagelo/mabs"),
      )[通过在模拟数据上进行有监督训练，为 DDPM 生成一个更好的 Guidance，进而提高 DDPM 的降噪结果],
    )
  }


  let shasm4 = {
    translate(
      zh: cventry(
        tl: [*Sha-512-SM4-block-chiper*，基于 SHA-512 和 SM4 的 C++ 实现的分组加密。],
        tr: githublink("chagelo/Sha-512-SM4-block-chiper"),
      )[ - 通过用户输入的唯一的密码对文件加密解密
         - 首次结合了 SHA-512 和 SM4 密码算法，SHA-512 对用户输入的密码进行加密，将结果作为 SM4 的密钥，对文件、视频等进行分组加密，
         - 实现了 ECB、CBC、CFB、OFB、CTR 分组加密模式
         - 支持对任意文件类型、大小加密解密
        ],
    )
  }

  let honors = {
    translate(
      zh: [ 
         - 2019 年第 44 届 ACM-ICPC 亚洲区域赛银川站铜奖
         - 2019 年 CCPC 江苏赛区银奖
         - 2020 年第 17 届江苏省高等数学竞赛一等奖
         - 2019 年蓝桥杯江苏省赛一等奖
        ],
    )
  }

  let skills = {
    translate(
      zh: [ 
         - 编程语言：熟悉 C++, 熟悉 STL
         - 算法：熟悉常用基础算法，熟悉部分图论算法和高级数据结构
         - 数学：熟练掌握高等数学、熟悉初等数论
         - 工具：熟悉 git 使用，熟悉部分 linux 常用命令
         - 数据库：熟悉 leveldb、bitcask
        ],
    )
  }

  let misc = {
    translate(
      zh: [
        - #link("https://chagelo.github.io/", "git pages")
        - #link("https://www.cnblogs.com/shinidetiehanhan", "博客园 chagelo")
      ]
    )
   
  }

  // Start of the document

  translate(en: [= #smallcaps[Tesla Zhang]], zh: [= 刘远东])

  [#link("mailto:changeto104@gmail.com")[changeto104\@gmail.com] $dot.c$ #link("https://github.com/chagelo", "https://github.com/chagelo")$dot.c$ #link("tel:+8613245078962")[+8613245078962]]

  edu

  translate(en: [== Related Projects], zh: [== 项目经历])
  cmu15445
  bitcask
  mabs
  shasm4

  translate(zh: [== 荣誉])
  honors

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 博客])
  misc

}
