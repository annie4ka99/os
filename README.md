# os-lab5
Лабораторная работа №5. Работа с файлово-каталожной системой в ОС Linux </br>
1. Скрипт rmtrash </br>
a. Скрипту передается один параметр – имя файла в текущем каталоге вызова скрипта.</br>
b. Скрипт проверяет, создан ли скрытый каталог trash в домашнем каталоге пользователя. Если он
не создан – создает его.</br>
c. После этого скрипт создает в этом каталоге жесткую ссылку на переданный файл с уникальным
именем (например, присваивает каждой новой ссылке имя, соответствующее следующему
натуральному числу) и удаляет файл в текущем каталоге.</br>
d. Затем в скрытый файл trash.log в домашнем каталоге пользователя помещается запись,
содержащая полный исходный путь к удаленному файлу и имя созданной жесткой ссылки.</br>
2. Скрипт untrash</br>
a. Скрипту передается один параметр – имя файла, который нужно восстановить (без полного пути –
только имя).</br>
b. Скрипт по файлу trash.log должен найти все записи, содержащие в качестве имени файла
переданный параметр, и выводить по одному на экран полные имена таких файлов с запросом
подтверждения.</br>
c. Если пользователь отвечает на подтверждение положительно, то предпринимается попытка
восстановить файл по указанному полному пути (создать в соответствующем каталоге жесткую
ссылку на файл из trash и удалить соответствующий файл из trash). Если каталога, указанного
в полном пути к файлу, уже не существует, то файл восстанавливается в домашний каталог
пользователя с выводом соответствующего сообщения.</br>
3. Скрипт backup</br>
a. Скрипт создаст в /home/user/ каталог с именем Backup-YYYY-MM-DD, где YYYY-MM-DD –
дата запуска скрипта, если в /home/user/ нет каталога с именем, соответствующим дате,
отстоящей от текущей менее чем на 7 дней. Если в /home/user/ уже есть «действующий»
каталог резервного копирования (созданный не ранее 7 дней от даты запуска скрипта), то новый
каталог не создается. Для определения текущей даты можно воспользоваться командой date.</br>
b. Если новый каталог был создан, то скрипт скопирует в этот каталог все файлы из каталога
/home/user/source/ (для тестирования скрипта создайте такую директорию и набор файлов в
ней). После этого скрипт выведет в режиме дополнения в файл /home/user/backup-report
следующую информацию: строка со сведениями о создании нового каталога с резервными
копиями с указанием его имени и даты создания; список файлов из /home/user/source/,
которые были скопированы в этот каталог.</br>
c. Если каталог не был создан (есть «действующий» каталог резервного копирования), то скрипт
должен скопировать в него все файлы из /home/user/source/ по следующим правилам: если
файла с таким именем в каталоге резервного копирования нет, то он копируется из
/home/user/source. Если файл с таким именем есть, то его размер сравнивается с размером
одноименного файла в действующем каталоге резервного копирования. Если размеры совпадают,
файл не копируется. Если размеры отличаются, то файл копируется c автоматическим созданием
версионной копии, таким образом, в действующем каталоге резервного копирования появляются
обе версии файла (уже имеющийся файл переименовывается путем добавления дополнительного
расширения «.YYYY-MM-DD» (дата запуска скрипта), а скопированный сохраняет имя). После
окончания копирования в файл /home/user/backup-report выводится строка о внесении
изменений в действующий каталог резервного копирования с указанием его имени и даты
внесения изменений, затем строки, содержащие имена добавленных файлов с новыми именами, а
затем строки с именами добавленных файлов с существовавшими в действующем каталоге
резервного копирования именами с указанием через пробел нового имени, присвоенного
предыдущей версии этого файла.</br>
4. Скрипт upback</br>
a. Скрипт должен скопировать в каталог /home/user/restore/ все файлы из актуального на
данный момент каталога резервного копирования (имеющего в имени наиболее свежую дату), за
исключением файлов с предыдущими версиями.
