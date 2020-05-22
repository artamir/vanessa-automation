Процедура Информация(Текст);
	Сообщить("ИНФОРМАЦИЯ - " + Текст);
КонецПроцедуры

Процедура ПроверитьСущестованиеКаталога(Путь)
	ФайлКаталога = Новый Файл(Путь);
	Если НЕ ФайлКаталога.Существует() Тогда
		ПроверитьСущестованиеКаталога(ФайлКаталога.Путь);
		Информация("Создан каталог: " + Путь);
		СоздатьКаталог(Путь);
	КонецЕсли;
КонецПроцедуры

Функция ФайлыСкриптовРазличаются(КаталогСкриптов, ПутьФайлаМакета)

	ФайлМакета = Новый Файл(ПутьФайлаМакета);
	Если НЕ ФайлМакета.Существует() Тогда
		Возврат Истина;
	КонецЕсли;

	ТаблицаЗначений = Новый ТаблицаЗначений;
	ТаблицаЗначений.Колонки.Добавить("ХешСумма");
	ТаблицаЗначений.Колонки.Добавить("Количество");

	МасивФайлов = НайтиФайлы(КаталогСкриптов,"*.js", Ложь);
	Для каждого ФайлСкрипта Из МасивФайлов Цикл
		ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.SHA256);
		ХешированиеДанных.ДобавитьФайл(ФайлСкрипта.ПолноеИмя);
		Стр = ТаблицаЗначений.Добавить();
		Стр.ХешСумма = ХешированиеДанных.ХешСуммаСтрокой;
		Стр.Количество = 1;
	КонецЦикла;

	ВременныйКаталог = ПолучитьИмяВременногоФайла();
	УдалитьФайлы(ВременныйКаталог);
	СоздатьКаталог(ВременныйКаталог);

	ЧтениеZipФайла = Новый ЧтениеZipФайла(ПутьФайлаМакета);
	МассивЭлементовБиблиотеки = Новый Массив;
	Для Каждого ЭлементZipФайла Из ЧтениеZipФайла.Элементы Цикл
		ЧтениеZipФайла.Извлечь(ЭлементZipФайла, ВременныйКаталог, РежимВосстановленияПутейФайловZIP.Восстанавливать);
		ИмяФайлаСкрипта = ВременныйКаталог + "/" + ЭлементZipФайла.ПолноеИмя;
		ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.SHA256);
		ДвоичныеДанные = Новый ДвоичныеДанные(ИмяФайлаСкрипта);
		ХешированиеДанных.Добавить(ДвоичныеДанные);
		Стр = ТаблицаЗначений.Добавить();
		Стр.ХешСумма = ХешированиеДанных.ХешСуммаСтрокой;
		Стр.Количество = 1;
	КонецЦикла;
	УдалитьФайлы(ВременныйКаталог);
	ЧтениеZipФайла.Закрыть();

	ТаблицаЗначений.Свернуть("ХешСумма", "Количество");
	Для каждого Стр Из ТаблицаЗначений Цикл
		Если Стр.Количество = 1 Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;

	Возврат Ложь;
	
КонецФункции	

Процедура УпаковатьМакетСкриптов(КаталогСкриптов, ПутьФайлаМакета)

	ФайлКаталога = Новый Файл(КаталогСкриптов);
	Если НЕ ФайлКаталога.Существует() Тогда
		ТекстСообщения = "Каталог <" + КаталогСкриптов + "> не существует.";
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;
	
	ФайлМакета = Новый Файл(ПутьФайлаМакета);
	ПроверитьСущестованиеКаталога(ФайлМакета.Путь);
	УдалитьФайлы(ПутьФайлаМакета);
	
	ЗаписьZIP = Новый ЗаписьZipФайла(ПутьФайлаМакета); 
	МасивФайлов = НайтиФайлы(КаталогСкриптов,"*.js", Ложь);
	Для каждого ФайлСкрипта Из МасивФайлов Цикл
		ЗаписьZIP.Добавить(ФайлСкрипта.ПолноеИмя, РежимСохраненияПутейZIP.НеСохранятьПути);
		Информация("Добавлен файл: " + ФайлСкрипта.Имя);
	КонецЦикла;
	ЗаписьZIP.Записать();
	Информация("Создан макет: " + ПутьФайлаМакета);

КонецПроцедуры

КаталогСкриптов = "./lib/VA_Chrome/";
ПутьФайлаМакета = "./VanessaAutomation/Templates/БиблиотекаJavaScript/Ext/Template.bin";
Информация("Сборка макета библиотеки скриптов JavaScript.");
Если ФайлыСкриптовРазличаются(КаталогСкриптов, ПутьФайлаМакета) Тогда
	УпаковатьМакетСкриптов(КаталогСкриптов, ПутьФайлаМакета);
Иначе
	Информация("Состав библиотеки JavaScript не изменился.");
КонецЕсли;
