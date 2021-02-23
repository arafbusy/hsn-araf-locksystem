Script Hasan'ın yapmış olduğu hotwire sisteminin üzerine geliştirilmiştir. Script'in üzerindeki tüm değişiklikler benim tarafımdan yapılmıştır.

### Özellikler
- Anahtarına sahip olduğunuz araçları L tuşuyla kilitleyebilir veya açabilirsiniz.
- Anahtarına sahip olmadığınız kilitli araçların kapısını maymuncuk kullanarak açabilirsiniz.
- Eğer bir aracın üstü açıksa kilitli olsa bile kapının iç tarafından açılabilir. Bu yüzden maymuncuk kullanmanıza gerek kalmaz.
- Eğer bir aracın kapısı açıksa veya kapısı yoksa içine girilebilir. Kapısı olmayan aracı maymuncuklamanız gerekmez.
- Aracın içine girdiğinizde anahtara sahip değilseniz düz kontak yapabilir veya aracı arayabilirsiniz.
- Aracı aradığınızda bulacağınız eşyalar tamamen rastgeledir. İhtimaller şansa göre çok değişkendir.
- Aracı maymuncukladığınızda skill bar ile yapabilmeniz gerekmektedir. En iyi ihtimalle şanslıysanız üç kere, en kötü ihtimalle 6 kere skill bar tamamlamanız gerekiyor.
- Config ve Locale dosyaları oluşturularak düzenli bir yapı sağlanmıştır. Config'den istediğiniz gibi bir şeyleri değiştirebilir, locale ile istediğiniz dile çevirebilirsiniz.

### Gereksinimler
Mythic Notify : https://github.com/FlawwsX/mythic_notify
Reload Skillbar : http://www.mediafire.com/file/0ghzkjpnnllnt95/reload-skillbar.rar/file
T0sic Loading Bar : https://github.com/t0sic/t0sic_loadingbar

### Kurulum
- Dosyayı indirdikten sonra sunucu dosyalarınızın resources klasörünün içinde istediğiniz bir yere atın.
- İsmini hsn-araf-locksystem olarak değiştirin, sonundaki main yazısını kaldırın.
- server.cfg dosyanızda en alta;
ensure hsn-araf-locksystem
satırını ekleyin.

### Önemli Not
Script'i yaparken üzerinde düzenleme yapabilmeniz için isminin değiştirilememesini zorunlu kılmadım, lütfen ismini değiştirmeyin!
Kullanım
Eğer bir sistemde bir araç oluşturuluyorsa ve oyuncuya anahtar vermek istiyorsanız, düz kontak yapmasını istemiyorsanız araç oluşturulan kod satırının altına bu satırı eklemelisiniz.
local plate = GetVehicleNumberPlateText(vehicle)
exports['hsn-araf-locksystem']:AddKeys(plate)


Video : https://youtu.be/_nK2pqcbKmQ
İndirme : https://github.com/slmaraf/hsn-araf-locksystem
