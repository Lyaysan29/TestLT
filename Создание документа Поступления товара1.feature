﻿#language: ru

@tree

Функционал: Создание документа поступление товара

Как Менеджер по закупкам я хочу
создание документов поступления товара
чтобы поставить товар на учет   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: Создание документа поступление товаров
 //Создание документа
*Открытие формы Создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
*Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	Тогда элемент формы с именем "Склад" стал равен 'Большой'	
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000004' | 'Шлюзовая ООО' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000026' | 'Молоко'       |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И в таблице "Товары" я завершаю редактирование строки
*Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'N' | 'Товар'  | 'Артикул' | 'Цена'  | 'Количество' | 'Сумма'  |
		| '1' | 'Молоко' | 'Mol34'   | '30,00' | '15,00'      | '450,00' |		
	И я нажимаю на кнопку "Записать"
*Номер
	И я запоминаю значение поля с именем "Номер" как "$Номер$"
		
*Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
*Проверка создания документа
//чтобы VA сразу отображало значение полей открытой формы в шагах необходимо установить галочку
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	 
	
		Сценарий: Проверка наличия в справочнике номенклатура торт
		И В командном интерфейсе я выбираю 'Продажи' 'Товары'
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'   |				
					