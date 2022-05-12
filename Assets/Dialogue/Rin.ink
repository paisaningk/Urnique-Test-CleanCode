INCLUDE globals.ink
{FistTalkrin == false: -> introduce | -> Check}

=== Check ===
สวัสดี
 { 
    - RinHeart == 0:
        -> blackheart
    - RinHeart == 1:
        -> Blueheart
    - RinHeart == 2:
        -> Pinkheart
    - RinHeart == 3:
       ->  Maxheart
}

=== introduce ===
สวัสดี
เธอเป็นฮันเตอร์หน้าใหม่สินะ
ฉันมีชื่อว่า ริน
ฉันเป็นนักวิจัยที่อาศัยอยู่แถวนี้
แล้วเธอพึ่งเคยมาที่นี้ใช่ไหม ?
    + [ใช่ ฉันพึ่งเคยมาที่นี้]
    เธอมาที่นี้เพื่อจะทำภารกิจหรอ
    แปลกใจจัง ยังจะมีคนกล้ามาทำภารกิจนี้อีกหรอ
    ที่แห่งนี้มันอันตรายมากๆเลยนะ
    ฉันจะเล่าเรื่องราวของที่นี้ ให้เธอฟัง   
    ฉันเห็นฮันเตอร์มากมายต้องการชื่อเสียงและเงินทอง จากดันเจี้ยนนี้
    แต่ว่านะ...ไม่มีใครเคยรอดกลับมาเลยแม้แต่คนเดียว
    ถ้าเธอมาเพื่อชื่อเสียงและเงินทองล่ะก็ เธอก็ควรระวังตัวเอาไว้
    ~ FistTalkrin = true
        -> DONE
    + [ไม่ ฉันเคยมาที่นี้มาก่อน]
        อย่างงั้นหรอ
        ขอให้เธอโชคดีแล้วกัน
    ~ FistTalkrin = true
        -> DONE
=== blackheart ===
{RinPreference < 25:
    คุณฮันเตอร์หน้าใหม่มีธุระอะไรให้ฉันช่วยงั้นหรอ
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    ระวังอันตรายด้วยหละ
    -> DONE
  - else:
   สวัสดี คุณฮันเตอร์มีอะไรรึปล่าว 
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    ขอให้เธอเธอปลอดภัยจากการไปดันเจี้ยน 
    -> DONE
    + [ถามถึงคำขอ]
    -> HeartQuest1
}
=== Blueheart ===
{RinPreference < 50:
    สวัสดี คุณฮันเตอร์มีอะไรรึปล่าว
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    ถ้าเจอซากมอนเตอร์หรือหนังสือ ที่น่าสนใจอย่าลืมเอามาให้ฉันด้วยนะ
    -> DONE
  - else:
    ไง คุณฮันเตอร์มีอะไรรึปล่าว
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    เธอก็อย่าหักโหมมากเกินไปหละ ดูแลตัวเองด้วย
    -> DONE
    + [ถามถึงคำขอ]
    -> HeartQuest2
}
=== Pinkheart ===
{RinPreference < 75:
    เธอมีอะไรให้ฉันช่วยงั้นหรอ
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    คุณฮันเตอร์…พยายามเข้านะ
    -> DONE
  - else:
    เธอมีอะไรให้ฉันช่วยงั้นหรอ
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    คุณฮันเตอร์…พยายามเข้านะ   ขอให้เธอปลอดภัยจากการไปดันเจี้ยน 
    -> DONE
    + [ถามถึงคำขอ]
    -> HeartQuest3
}
=== Maxheart ===
มีอะไรที่ฉันจะช่วยเธอได้ไหม
    + [ฉันมีของจะให้เธอ]
    -> GiveItem
    + [ไม่มีอะไร]
    จะไปที่ดันเจี้ยนหรอดูแลตัวเองดีๆนะ  อย่าประมาทหละ  ฉันรอเธออยู่ที่นี้นะ
    -> DONE
=== GiveItem ===
{Item == 0:
    เธอไม่มีหนังสือที่จะให้ฉันหรอ
    หนังสือสามารถหาได้จากการชื้อในร้านค้า
  - else:
    ให้ฉันงั้นหรอ ขอบคุณมากเลยนะ
    หนังสือหายไปหนึ่งเล่ม
    ~Item --
    ~RinPreference += 10
}
-> END

=== HeartQuest1 ===
{HeartQuest01:
    {Monster >= 5:
        น.. น.. นี้นะหรอ ซากมอนเตอร์ขอบคุณนะ
        การวิจัยครั้งนี้ไม่รู้ว่าจะสำเร็จไหม
        บางที่ฉันอาจจะต้องให้เธอช่วยอีก
        ครั้งหน้า ขอรบกวนด้วยนะ คุณฮันเตอร์หน้าใหม่(ยิ้ม) 
        ~RinHeart = 1
        ~Monster -=5
  - else:
        ฉันยังไม่ได้ซากมอนเตอร์ ที่ต้องการเลย
        ช่วยเอาซากมอนเตอร์มาให้ฉันทีนะ
    }
    -> DONE
  - else:
        คือฉันกำลังวิจัยเกี่ยวกับพวกมอนเตอร์น่ะ
    ฉันจำเป็นต้องใช้ซากมอนเตอร์
    ฉันขอให้เธอช่วยเอาซากมอนเตอร์มาให้ฉันหน่อยได้ไหม
        + [ยอมรับ]
            ขอบคุณนะ
        ~HeartQuest01 = true
        -> DONE
        + [ปฏิเสธ]
            ฉันขอโทษที่รบกวนนะ
    -> DONE
}


=== HeartQuest2 ===
{HeartQuest02:
    {Monster >= 10:
    ขอบคุณมาก ๆ นะ
    เท่านี้การวิจัยของฉันก็ดำเนินไปต่อได้แล้ว
    ฉันมีของอยากจะให้เธอเพือขอบคุณที่ช่วยฉันมาตลอด
    มันคือสร้อยคอน่ะสร้อยที่พ่อของฉันใส่ระหว่างที่ท่านยังเป็นฮันเตอร์
    ท่านมอบไว้ให้ฉันก่อนที่ท่านจะจากไป…
    ฉันเก็บไว้ก็ไม่มีก็ไม่ได้ใช้น่ะ    
    ฉันเลยอยากจะให้สร้อยไว้กับเธอเพื่อเป็นการตอบแทน
    ~RinHeart = 2
    ~Monster -=10
  - else:
    ฉันต้องการซากมอนเตอร์มากจริง ๆ
    ช่วยเอา ซากมอนเตอร์..มาให้ฉันทีนะ
    }
    -> DONE
  - else:
    จากการวิจัยที่ฉันทำมา
    ฉันเจออะไรบางอย่างที่แปลกมากๆ
    จนฉันไม่สามารถทำความเข้าใจเกี่ยวกับมันได้
    ฉันต้องการซากมอนเตอร์มากกว่านี้
    ฉันอยากให้เธอตามหาซากมอนเตอร์ให้หน่อย ได้ไหม
        + [ยอมรับ]
            ขอบคุณมากๆ เลย
        ~HeartQuest02 = true
        -> DONE
        + [ปฏิเสธ]
            ฉันขอโทษที่รบกวนนะ
    -> DONE
}

=== HeartQuest3 ===
{HeartQuest03:
    {Monster >= 15:
    เธอปลอยภัยดีใช่ไหม
    ธ.. เธอเอามันมาได้แล้วหรอ!?
    ขอบคุณมากๆเลยนะ สำหรับซากมอนเตอร์หนะ
    งานวิจัยครั้งนี้จะต้องสำเร็จแน่นอน
    ที่งานวิจัยครั้งนี้ ยังทำต่อไปได้ต้องขอบคุณเธอมากๆเลยนะ คุณฮันเตอร์.. (ยิ้ม…)
    ~RinHeart = 3
    ~Monster -=15
  - else:
    ฉันต้องการซากมอนเตอร์มากจริงๆ นะ
    ช่วยเอา ซากมอนเตอร์..มาให้ฉันทีนะ
    }
    -> DONE
  - else:
    พวกเราไม่ได้เจอกันสักพักแล้วนะ  เธอปลอดภัยดีใช่ไหม
    ช่วงนี้เธอเป็นยังไงบ้าง
    ตลอดที่ผ่านมาเธอคอยช่วยในการวิจัยของฉันตลอดเลย
    เรื่องวิจัยที่ฉันทำใกล้สำเร็จแล้ว
    แต่ว่านะ ฉันยังต้องการซากมอนเตอร์อีกน่ะ
    ฉันอยากให้เธอช่วยเอา ซากมอนเตอร์มาให้ฉันอีกรอบได้ไหม
        + [ยอมรับ]
            ขอบคุณมากๆ เลยนะ
        ~HeartQuest03 = true
        -> DONE
        + [ปฏิเสธ]
            ฉันขอโทษที่รบกวนนะ
    -> DONE
}

















