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
    translate(en: [== Education], zh: [== #text(weight: "bold")[教育经历]])
    let gpa1 = 3.56
    let psu-date = [#translate-date(9, 2021) -- #current]
    translate(
      zh: cventry(
        tl: [#text(weight: "bold")[中国科学技术大学]，计算机科学与技术，硕士],
        tr: psu-date,
      )[]
    )
    translate(
      zh: cventry(
        tl: [研究方向：计算机视觉, GPA #gpa1/4.10],
        tr: [合肥，安徽],
      )[]
    )

    let gpa2 = 4.30
    let cmu-date = [#translate-date(9, 2017) -- #translate-date(6, 2021)]
    translate(
      zh: cventry(
        tl: [#text(weight: "bold")[常州大学]，计算机科学与技术，本科],
        tr: cmu-date,
      )[]
    )

    translate(
      zh: cventry(
        tl: [GPA #gpa2/5.00],
        tr: [常州，江苏],
      )[]
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
      - 执行器：实现了多种语句的执行器，如 Aggregate、Group By、TopN 等
      - 优化器：将 NestedLoopJoin 优化为 HashJoin，Filter 下推，去除 Filter 中存在的常量表达式
      - 并发控制：基于 2PL 设计 LockManager，支持 RR, RC, RU 三种事务隔离级别和表、行两种粒度的五种锁类型，实现死锁的检测和解除
      ],
    )
  }

  let bitcask = {
    translate(
      zh: cventry(
        tl: [*Bitcask*，面向内存的 bitcask kv 存储引擎],
        tr: githublink("chagelo/bitcask-go"),
      )[
- 磁盘：将标准文件操作 API 进行简单封装，使用 hintfile 提高加载索引速度，通过 mmap 提高读取数据效率
- 索引：支持 B 树，ART，B+ 树三种索引结构
- 文件 merge：通过文件 merge 对无效数据进行清理，定期 merge 节省磁盘空间，提高数据库启动时加载速度
- 事务：实现了串行化的事务，满足 ACID 特性
      ],
    )
  }

  let tinykv = {
    translate(
      zh: cventry(
        tl: [*Tinykv*, 支持横向扩展、高可用，支持分布式事务的 kv 数据库],
        tr: githublink("chagelo/tinykv"),
      )[
        - Raft 层，支持 Leader 选举、日志复制、单步成员变更、Snapshot 等基础功能
        - 采用 Multi-Raft 架构，数据基于 Region 进行分区，每个 Region 组成一个 Raft Group。当数据规模不断增大，Region 支持自动分裂
        - 实现了 MVCC 多版本控制，基于 Percolator 模型设计了分布式事务系统
      ]
    )
  }

  let mabs = {
    translate(
      zh: cventry(
        tl: [*MABS*，基于扩散模型的核磁图像去运动伪影],
        tr: githublink("chagelo/mabs"),
      )[通过在模拟数据上进行有监督训练，为 DDPM 生成一个更好的 Guidance，进而提高 DDPM 的降噪效果],
    )
  }


  let shasm4 = {
    translate(
      zh: cventry(
        tl: [*Sha-512-SM4-block-chiper*，基于 SHA-512 和 SM4 的 C++ 实现的分组加密],
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
         - #text(weight: "bold")[铜奖], 2019 年第 44 届 ACM-ICPC 亚洲区域赛银川站
         - #text(weight: "bold")[银奖], 2019 年 CCPC 江苏赛区
         - #text(weight: "bold")[一等奖], 2020 年第 17 届江苏省高等数学竞赛
         - #text(weight: "bold")[一等奖], 2019 年蓝桥杯江苏省赛
        ],
    )
  }

  let skills = {
    translate(
      zh: [ 
         - 编程语言：熟悉 C++，熟悉 STL，了解 Rust、Python
         - 算法：熟悉常用基础算法，熟悉部分图论算法和高级数据结构
         - 工具：熟悉 git 使用，熟悉部分 linux 常用命令
         - 数据库&分布式：熟悉 leveldb、bitcask，熟悉 Raft
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

  translate(en: [= #smallcaps[Yuandong Liu]], zh: [= #text(weight: "bold")[刘远东]])

  [#link("mailto:yuggu_cs@outlook.com")[yuggu_cs\@outlook.com] $dot.c$ #link("https://github.com/chagelo", "https://github.com/chagelo")$dot.c$ #link("tel:+8613245078962")[+8613245078962]]

  edu

  translate(en: [== Related Projects], zh: [== 项目经历])
  cmu15445
  bitcask
  tinykv
  mabs
  shasm4

  translate(zh: [== 荣誉])
  honors

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 博客])
  misc

}
