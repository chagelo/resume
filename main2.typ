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
    let cmu-date = [#translate-date(8, 2023) -- #current]
    translate(
      zh: cventry(
        tl: [常州，计算机科学与技术，本科],
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
      - 内存：基于 LRU-K 页面替换策略设计 Buffer Pool，
      - 索引：基于 B+ 树，实现非聚簇索引，利用每个节点独立的读写锁兼顾了多线程并发访问的安全性和效率，支持通过迭代器对数据进行基于关键字的范围查找
      - 执行器：采用火山模型，实现了多种语句的执行器，如 SELECT, INSERT, GROUP BY, JOIN
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
         - 支持对任意文件加密解密
        ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("YouTrack", "Jira", "GitHub", "BitBucket", /* "Coding.net", "Tower", */ "Slack", "JetBrains Space")
      translate(en: [
        - Tools: editor-agnostic, have experience with team tools like #tools.join(", ") and more.
      ], zh: [- 开发工具：能适应任何常见编辑器/操作系统，有使用 #tools.join("、") 等团队协作工具的经验。])
    }
    let compiler = translate(en: [
      - Compiler: understand various program representations such as CFG, ANF, (P)HOAS, etc. and normalization by evaluation.
        #noSimple[Familiar with most parser generators, understand layout syntax parsing.]
    ], zh: [
      - 编译器：理解多种程序表示，例如 CFG, ANF, (P)HOAS 等，理解语义正规化（NbE）。熟悉大部分 parser 生成器，理解布局的语法解析。
    ])
    let progLang = {
      translate(zh: [
        - 编程语言：熟悉 C++
      ])
    }
    let ideDev = {
      let pref = "https://plugins.jetbrains.com/plugin/"
      let julia = link(pref + "10413")[Julia]
      let dtlc  = link(pref + "12176")[DTLC]
      let pest  = link(pref + "12046")[Pest]
      translate(en: [
        - IDE Tooling: *4 years of experience*, familiar with the IntelliJ Platform infrastructure (created #julia, #dtlc, #pest, etc.), also have experience with Eclipse/SonarQube/VSCode plugin development.
      ], zh: [
        - IDE 工具开发：*4 年开发经验*，熟悉 IntelliJ 平台的基础设施（开发了 #julia、#dtlc、#pest 等插件），同时了解 Eclipse/SonarQube/VSCode 的插件开发。
      ])
    }
    let kotlinJava = {
      let before-swing = "JNI, JPMS, Gradle, Kotlin coroutines"
      translate(
        en: [- Kotlin/Java: *8 years of experience*, familiar with #before-swing, and Swing.],
        zh: [- Kotlin/Java：*8 年开发经验*，熟悉 #before-swing, Swing。]
      )
    }
    let mobileDev = translate(
      en: [- Mobile Development: *2 years of experience*, familiar with Flutter and Android.],
      zh: [- 移动端开发：*2 年开发经验*，熟悉 Flutter、Android。]
    )
    let typeTheory = translate(
      en: [- Type Theory: understand Martin-Löf type theory, coinduction, HoTT, and Cubical, familiar with Idris, Agda (*3 years* of experience, contributor), Arend and some Lean/F★/Coq.],
      zh: [- 类型论：理解 Martin-Löf 类型论、逆归纳法、同伦类型论、立方类型论；熟悉 Idris，Agda（*3 年经验*，编译器和标准库贡献者），Arend 和一些 Lean/F★/Coq。]
    )
    progLang
    compiler
    kotlinJava
    typeTheory
    noSimple[
      - *JetBrains MPS*: #translate(
        en: [understand concepts and applications of #link("https://www.jetbrains.com/mps/")[Language-Oriented Programming].],
        zh: [理解 #link("https://www.jetbrains.com/mps/")[面向语言编程] 的概念和应用。]
      )
    ]
    ideDev
    noSimple[#mobileDev]
    devTools
  }

  let misc = {
    let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
    let osc      = link("https://ice1000.org/opensource-contributions")
    // bintray  = "https://bintray.com/ice1000"
    let crates   = "https://crates.io/users/ice1000"
    // What to do with this?
    // let personal = "https://personal.psu.edu/yqz5714"
    let seRep    = [6000+]
    let paRep    = [5000+]
    let stackex(e) = link("https://stackexchange.com/users/9532102")[#e]
    let pase     = link("https://proofassistants.stackexchange.com/users/32/ice1000")[Proof Assistants]
    // https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
    let enSimple = link("https://tinyurl.com/y8xdlfug")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
    let enElab   = link("https://tinyurl.com/y2v59t36")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
    let cnLink   = link("https://tinyurl.com/ya4urea8")
    let codewars = link("https://www.codewars.com/users/ice1000")[CodeWars]
    let cwLevel  = [*1 dan*]
    let cwPerc   = [0.020%]
    let cwRank   = [\#111]
    let projects = [*agda, Arend, libgdx, jacoco, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, intellij-rust, TeXiFy-IDEA, rust-analyzer*]

    translate(en: noSimple(simple: [
      - Profile links (please use a PDF reader with hyperlink support):
        #link(crates)[Crates.io],
        #link(intellij)[IntelliJ] Marketplace
    ])[
      - Crates.io: #link(crates), publishing interesting Rust libraries
      - IntelliJ Marketplace: #link(intellij)
    ], zh: [
      - 相关个人页面链接（请使用支持超链接的 PDF 阅读器）：#link(crates)[Crates.io] 主页，#link(intellij)[IntelliJ] 插件市场主页
    ])
    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 语言：English - 熟练 (托福 100)，汉语 - 母语水平]
    )
    translate(
      en: [
        - Open-source contributions: #osc, #noSimple[member of JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang and more,]
          contributed to #projects and other projects #noSimple[(apart from organization ones)]
      ],
      zh: [- 开源贡献: #osc，向 #projects 等项目贡献过代码]
    )
    [- #link("https://stackoverflow.com/users/7083401/ice1000")[StackOverflow]: #seRep
      #translate(
        en: [reputation, also active on #pase (#paRep reputation) and #stackex("other StackExchange sites")],
        zh: [声誉，同时也在 #pase（#paRep 声誉）和#stackex("其他 StackExchange 子站")活跃]
      )
    ]
    translate(
      en: [
        - Latest revision of this resume: one-page version #enSimple, complete version: #enElab
        #noSimple[- Get the Chinese version of this resume: #cnLink]
      ],
      zh: [- 获取此简历的最新更新：中文版本 #cnLink，英语版本 #enElab，单页版本（仅英语）：#enSimple]
    )
    translate(
      en: [
        - #cwLevel on #codewars, ranked #cwRank on the whole site (Top #cwPerc),
          #noSimple[solving and making new coding challenges] primarily in Haskell, Agda, and Idris
          #noSimple[and some other JVM languages]
      ],
      zh: [- 在 #codewars 上，以 Haskell、Agda 和 Idris 为主，达到 #cwLevel，全站排名 #cwRank（前 #cwPerc）]
    )
  }

  // Start of the document

  translate(en: [= #smallcaps[Tesla Zhang]], zh: [= 刘远东])

  [#link("mailto:changeto104@gmail.com")[changeto104\@gmail.com] $dot.c$ #iconlink(icon: "fa-github", text: "https://github.com/chagelo", "https://github.com/chagelo")]

  edu

  translate(en: [== Related Projects], zh: [== 项目经历])
  cmu15445
  bitcask
  mabs
  shasm4

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc

  // https://github.com/typst/typst/issues/1462
}
