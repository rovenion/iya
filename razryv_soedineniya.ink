
VAR trust_father = 0       // Уровень доверия к отцу
VAR honesty_score = 0      // Насколько Ия честна сама с собой
VAR use_mirror = 0         // Использовала ли Ия Зеркало
VAR public_post = false    // Опубликовала ли Ия статью
VAR sister_conflict_seen = false // Увидела ли Ия ссору сестры
VAR sister_intervention = false // Вмешалась ли Ия

==chapter_start==
#Location: Столовая
#Left: Отец
#Right: Ия

*narration:*  
За окном — море, как зеркало. На столе — фрукты, миска каши и планшет отца с интерфейсом “Зеркала”.

ОТЕЦ:  
Мы поставили тебе модуль наблюдения. Временный. После истории с техотсеком и штормботом — извини. Мы просто боимся.

Ия: (Выбери ответ)
* [Ты не имел права.]  
    Ия:  
    Ты не имел права без моего согласия.

    ~ trust_father -= 1

* [Я больше не ребёнок.]  
    Ия:  
    Я больше не ребёнок, пап. Ты это знаешь.

    ~ trust_father -= 1

* [А можно было поговорить?]  
    Ия:  
    Можно было хотя бы поговорить со мной. До.

    ~ trust_father += 1

*narration:*  
Малыши лепят из еды дирижабли. А у тебя внутри — как перед штормом.

->mirror_article

==mirror_article==
#Location: Кабина Ии, поздний вечер
#Left: Экран
#Right: Ия

*narration:*  
Ты создала пустой профиль — Ия_01. Без местоположения. Без данных.  
Пишешь статью: *"Как выглядит забота, когда она становится занозой в когтях."*

Ия: (Опубликовать?)
* [Оставить в черновиках]
    ~ honesty_score += 1
    ->storm_alarm

* [Выложить в подростковый чат]
    ~ honesty_score += 1
    ->storm_alarm

* [Выложить публично]
    ~ public_post = true
    ~ honesty_score += 2
    ->storm_alarm

==storm_alarm==
#Location: Комната связи
#Left: Дядя Гена
#Right: Мама

*narration:*  
Шторм близко. Трое малышей не вернулись с прогулки. Паника.  
Отец запускает карту из “Зеркала”.

*интерфейс показывает: маршрут, температурные зоны, капли на объективе камер.*

*narration:*  
Малышей находят в коридоре за генераторной. Все живы. Все целы.

Ия: (Твоя реакция?)
* [Порадоваться, что система сработала.]
    ~ trust_father += 1

* [Молча уйти.]
    ~ honesty_score -= 1

* [Сказать отцу: это всё равно не оправдание.]
    ~ trust_father -= 1

->mirror_reveal

==mirror_reveal==
#Location: Кабина Ии
#Left: Интерфейс
#Right: Ия

*narration:*  
Ты включаешь “Зеркало”. Ищешь не маршрут — а след сестры.

*narration:*  
Видео: она толкает девочку, потом прячется, говорит взрослым, что "всё хорошо".

~ use_mirror += 1
~ sister_conflict_seen = true

Ия: (Что ты сделаешь?)
* [Поговорить с сестрой лично]
    ->talk_with_sister

* [Оставить всё как есть]
    ~ honesty_score -= 1
    ->father_confrontation

==talk_with_sister==
#Location: Детский отсек
#Left: Ия
#Right: Сестра

*narration:*  
Плюшевый дирижабль у неё в лапах. Глаза — испуганные.

Ия:  
Я видела. Через “Зеркало”.

Сестра (шёпотом):  
Она первая…

Ия:  
Но ты — старше. Ты можешь выбрать быть честной.

* [Нет. Но будь честной, ладно?]
    Ия:  
    Я никому не скажу. Если ты больше так не сделаешь.

    Сестра:  
    Обещаю.

    ~ sister_intervention = true
    ~ honesty_score += 1

* [Расскажу, если ещё раз повторится.]
    Ия:  
    Сейчас — нет. Но если ещё раз, расскажу.

    Сестра (сникла):  
    Хорошо…

    ~ sister_intervention = true

->father_confrontation

==father_confrontation==
#Location: Кабина управления
#Left: Отец
#Right: Ия

ОТЕЦ:  
Я думал, делаю правильно. Но вижу, что ранил тебя.  
Я закрою «Зеркало», если ты скажешь, что оно не нужно.

Ия: (Ответ)
* [Он нужен — но не мне.]
    Ия:  
    Он может быть полезен малышам. Но мне — мешает.

    ~ trust_father += 1

* [Оставь его для малышей. Не для всех.]
    Ия:  
    Сделай возрастной фильтр. Или отключение по желанию.

    ~ trust_father += 1

* [Удаляй. И будь просто отцом.]
    Ия:  
    Не хочу жить под наблюдением. Просто будь рядом, когда я ошибусь.

    ~ trust_father -= 1

->chapter_end

==chapter_end==
#Location: Утро на платформе
#Left: Ия
#Right: Море

*narration:*  
Письмо от экспедиции. Ты идёшь на прощальный пирс.

Малыши машут игрушками. Дядя Гена держит термос:

ДЯДЯ ГЕНА:  
Вот и пчела. Пусть тебя не укусит. А если укусит — сделай выводы.

*narration:*  
Система не исчезла. Но ты научилась видеть за ней — выбор.  
А значит, ты готова к новому.

-> END
