<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Page;
use App\Models\Product;
use App\Models\Slider;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    private const SHOP = 'Humaira Enterprise';

    private const PHONE = '01754471654';

    private const EMAIL = 'info@humairaenterprise.com';

    public function run(): void
    {
        User::firstOrCreate(
            ['email' => env('ADMIN_EMAIL', 'admin@gmail.com')],
            [
                'name' => 'Admin',
                'password' => env('ADMIN_PASSWORD', 'admin000'),
                'phone' => self::PHONE,
            ]
        )->forceFill(['is_admin' => true])->save();

        User::firstOrCreate(
            ['email' => 'customer@gmail.com'],
            [
                'name' => 'Customer',
                'password' => 'customer000',
            ]
        );

        $categories = [];
        foreach ([
            ['Feeding', 'feeding', 'Bottles, sippy cups and everyday feeding essentials for little ones.', 'feeding.jpg'],
            ['Diapers & Wipes', 'diapers-wipes', 'Soft diapers and gentle wipes for newborns and toddlers.', 'diapers.jpg'],
            ['Baby Clothing', 'baby-clothing', 'Soft cotton rompers, blankets and everyday wear.', 'clothing.jpg'],
            ['Toys & Play', 'toys-play', 'Soft toys and teethers chosen for safe play.', 'toys.jpg'],
            ['Nursery', 'nursery', 'Mobiles, strollers and pieces that make the nursery calm.', 'nursery.jpg'],
            ['Bath & Care', 'bath-care', 'Bathtubs, lotion and gentle care for bath time.', 'bath-care.jpg'],
        ] as $i => [$name, $slug, $description, $image]) {
            $categories[$slug] = Category::updateOrCreate(['slug' => $slug], [
                'name' => $name,
                'description' => $description,
                'image' => 'assets/images/categories/'.$image,
                'sort_order' => $i,
                'is_active' => true,
            ]);
        }

        foreach ($this->products() as $row) {
            [$name, $slug, $cat, $price, $sale, $variant, $image, $featured, $stock, $short, $specs] = $row;
            Product::updateOrCreate(['slug' => $slug], [
                'category_id' => $categories[$cat]->id,
                'name' => $name,
                'short_description' => $short,
                'description' => '<p>'.$short.'</p>'
                    .'<h3>Details</h3><ul>'.implode('', array_map(fn ($s) => '<li>'.e($s).'</li>', $specs)).'</ul>'
                    .'<h3>Why buy from '.self::SHOP.'?</h3><ul><li>Baby products chosen for everyday use</li><li>Careful packing</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',
                'price' => $price,
                'sale_price' => $sale,
                'stock' => $stock,
                'unit' => $variant,
                'image' => 'assets/images/products/'.$image,
                'is_featured' => $featured,
                'is_active' => true,
                'free_shipping' => false,
            ]);
        }

        Slider::query()->delete();
        $now = now();
        Slider::insert([
            ['title' => 'Gentle Care for Every Day', 'subtitle' => 'Feeding, clothing and nursery picks for your baby', 'image' => 'assets/images/slides/slide-1.jpg', 'link' => 'shop.html?category=feeding', 'position' => 'main', 'sort_order' => 1, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'A Calm Nursery', 'subtitle' => 'Soft blankets, mobiles and bath-time essentials', 'image' => 'assets/images/slides/slide-2.jpg', 'link' => 'shop.html?category=nursery', 'position' => 'main', 'sort_order' => 2, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Feeding', 'subtitle' => null, 'image' => 'assets/images/products/feeding-bottle.jpg', 'link' => 'shop.html?category=feeding', 'position' => 'side', 'sort_order' => 1, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Soft Toys', 'subtitle' => null, 'image' => 'assets/images/products/plush-bunny.jpg', 'link' => 'shop.html?category=toys-play', 'position' => 'side', 'sort_order' => 2, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
            ['title' => 'Bath Time', 'subtitle' => null, 'image' => 'assets/images/products/baby-bathtub.jpg', 'link' => 'shop.html?category=bath-care', 'position' => 'side', 'sort_order' => 3, 'is_active' => true, 'created_at' => $now, 'updated_at' => $now],
        ]);

        foreach ($this->pages() as $slug => [$title, $content]) {
            Page::updateOrCreate(['slug' => $slug], ['title' => $title, 'content' => $content, 'is_active' => true]);
        }
    }

    /** [name, slug, category, price, sale price, variant, image, featured, stock, short description, specs] */
    private function products(): array
    {
        return [
            ['Soft Silicone Feeding Bottle 260ml', 'soft-silicone-feeding-bottle', 'feeding', 850, 690, '260ml, Blush', 'feeding-bottle.jpg', true, 40,
                'A soft silicone feeding bottle with a gentle nipple, easy to hold and simple to clean.',
                ['260ml capacity', 'Soft silicone body', 'Wide neck for easy cleaning', 'Slow-flow nipple', 'BPA free']],
            ['Sippy Cup with Handles', 'sippy-cup-with-handles', 'feeding', 650, 520, 'Blush', 'sippy-cup.jpg', true, 50,
                'A two-handle sippy cup that helps little hands learn to drink on their own.',
                ['Soft spout', 'Two easy-grip handles', 'Leak-resistant lid', 'Easy to take apart and wash', 'BPA free']],

            ['Newborn Diaper Pack', 'newborn-diaper-pack', 'diapers-wipes', 1290, 1090, '44 pieces', 'diaper-pack.jpg', true, 60,
                'Soft newborn diapers with a gentle fit for daytime and night.',
                ['44 pieces', 'Soft inner layer', 'Wetness indicator', 'Flexible sides', 'Newborn fit']],
            ['Fragrance-free Baby Wipes', 'fragrance-free-baby-wipes', 'diapers-wipes', 480, 390, '3 packs', 'baby-wipes.jpg', false, 80,
                'Thick, fragrance-free wipes for diaper changes and messy hands.',
                ['3 packs', 'Fragrance free', 'Soft cloth texture', 'Resealable pack', 'For face, hands and diaper changes']],

            ['Cotton Romper Set', 'cotton-romper-set', 'baby-clothing', 1450, 1190, '0 to 6 months', 'cotton-romper.jpg', true, 30,
                'A soft cotton romper set in blush and cream for everyday wear.',
                ['Soft cotton', 'Snap buttons for easy changing', '0 to 6 months', 'Gentle on skin', 'Machine washable']],
            ['Muslin Swaddle Blanket', 'muslin-swaddle-blanket', 'baby-clothing', 980, 790, 'Cream and blush', 'muslin-blanket.jpg', true, 35,
                'A breathable muslin swaddle that stays soft wash after wash.',
                ['Lightweight muslin', 'Generous size for swaddling', 'Breathable weave', 'Gets softer with washing', 'Cream and blush']],

            ['Plush Bunny Soft Toy', 'plush-bunny-soft-toy', 'toys-play', 890, 720, 'Cream', 'plush-bunny.jpg', true, 40,
                'A small plush bunny with a soft hug, made for cuddles and nursery shelves.',
                ['Soft plush', 'Lightweight', 'Stitched features', 'Suitable from birth with supervision', 'Surface wash']],
            ['Silicone Teether Set', 'silicone-teether-set', 'toys-play', 420, 350, 'Set of 3', 'teether-set.jpg', false, 70,
                'A set of soft silicone teethers in calm colours for soothing gums.',
                ['Set of 3', 'Soft silicone', 'Easy to grip', 'Fridge friendly', 'BPA free']],

            ['Wooden Baby Mobile', 'wooden-baby-mobile', 'nursery', 1650, 1390, 'Stars and moon', 'baby-mobile.jpg', true, 18,
                'A gentle wooden mobile with felt stars and a moon for the crib.',
                ['Wooden frame', 'Felt stars and moon', 'Calm motion', 'Nursery decor', 'For crib or cot']],
            ['Lightweight Baby Stroller', 'lightweight-baby-stroller', 'nursery', 8900, 7490, 'Blush', 'baby-stroller.jpg', true, 10,
                'A compact stroller that folds small and rolls smoothly for daily walks.',
                ['Lightweight frame', 'One-hand fold', 'Canopy for shade', 'Storage basket', 'Five-point harness']],

            ['Baby Bathtub with Seat', 'baby-bathtub-with-seat', 'bath-care', 2200, 1850, 'Warm white', 'baby-bathtub.jpg', false, 16,
                'A small bathtub with a soft seat so bath time stays steady and simple.',
                ['Built-in soft seat', 'Easy-drain plug', 'Non-slip base', 'Compact size', 'Simple to wipe clean']],
            ['Gentle Baby Lotion 400ml', 'gentle-baby-lotion', 'bath-care', 560, 450, '400ml', 'baby-lotion.jpg', false, 55,
                'A light daily lotion for soft skin after bath time.',
                ['400ml pump bottle', 'Light, non-greasy feel', 'For daily use', 'No strong fragrance', 'Dermatologically gentle formula']],
        ];
    }

    private function pages(): array
    {
        $phone = self::PHONE;
        $email = self::EMAIL;
        $shop = self::SHOP;

        return [
            'about-us' => ['About Us', <<<HTML
<h2>Welcome to {$shop}</h2>
<p><strong>{$shop}</strong> is a baby shop for feeding, diapers, clothing, toys, nursery and bath care. We pack everyday baby products with care and deliver them across Bangladesh.</p>
<hr>
<h3><i class="fa-solid fa-boxes-stacked"></i> What we offer</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-bottle-droplet"></i><span><strong>Feeding:</strong> bottles and sippy cups for daily meals.</span></li>
<li><i class="fa-solid fa-baby"></i><span><strong>Diapers &amp; wipes:</strong> soft diapers and fragrance-free wipes.</span></li>
<li><i class="fa-solid fa-shirt"></i><span><strong>Clothing:</strong> cotton rompers and muslin blankets.</span></li>
<li><i class="fa-solid fa-puzzle-piece"></i><span><strong>Toys:</strong> plush toys and teethers.</span></li>
<li><i class="fa-solid fa-bed"></i><span><strong>Nursery:</strong> mobiles and strollers.</span></li>
<li><i class="fa-solid fa-bath"></i><span><strong>Bath &amp; care:</strong> bathtubs and gentle lotion.</span></li>
</ul>
<hr>
<h3><i class="fa-solid fa-award"></i> Why shop with us?</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-check"></i><span>Products chosen for babies and everyday family use</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Clear prices and regular offers</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Cash on Delivery and secure online payment via shurjoPay (bKash, Nagad, Rocket, Visa, Mastercard)</span></li>
<li><i class="fa-solid fa-circle-check"></i><span>Home delivery all over Bangladesh</span></li>
</ul>
<hr>
<h3><i class="fa-solid fa-headset"></i> Contact us</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
<li><i class="fa-solid fa-envelope"></i><span>Email: <a href="mailto:{$email}">{$email}</a></span></li>
</ul>
HTML],
            'refund-returns' => ['Refund and Returns Policy', <<<HTML
<h2>Refund &amp; Returns Policy</h2>
<p>At <strong>{$shop}</strong> we want you to be happy with what arrives. If something is not right, this is how returns and refunds work.</p>
<h3><i class="fa-solid fa-circle-check"></i> Eligible for return / replacement</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-check"></i><span><strong>Wrong product delivered:</strong> the item is different from your order.</span></li>
<li><i class="fa-solid fa-circle-check"></i><span><strong>Damaged on arrival:</strong> the product or pack is damaged when it reaches you.</span></li>
<li><i class="fa-solid fa-circle-check"></i><span><strong>Missing items:</strong> pieces listed with the product are missing.</span></li>
</ul>
<p>Please tell us within <strong>3 days of delivery</strong> and share photos of the product and the packaging.</p>
<h3><i class="fa-solid fa-circle-xmark"></i> Not eligible</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-circle-xmark"></i><span>Opened hygiene products, including diapers, wipes and lotion, once the seal is broken</span></li>
<li><i class="fa-solid fa-circle-xmark"></i><span>Products used, washed or damaged after delivery</span></li>
<li><i class="fa-solid fa-circle-xmark"></i><span>Items returned without the original box or invoice</span></li>
<li><i class="fa-solid fa-circle-xmark"></i><span>Change of mind after the product has been used</span></li>
</ul>
<h3><i class="fa-solid fa-rotate-left"></i> Refund process</h3>
<ul>
<li>Once we receive and check the return, we confirm a refund or a replacement.</li>
<li>Approved refunds are processed within <strong>5 to 7 business days</strong>.</li>
<li>Online payments made through shurjoPay are refunded to the original payment method. Cash on Delivery orders are refunded via bKash, Nagad or bank transfer.</li>
<li>Delivery charges are refunded only when the return is our mistake.</li>
</ul>
<h3><i class="fa-solid fa-headset"></i> Contact us</h3>
<p>For a return or refund question, call or message us.</p>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
</ul>
HTML],
            'terms-conditions' => ['Terms & Conditions', <<<HTML
<h2>Terms &amp; Conditions</h2>
<p>By using the {$shop} website or placing an order, you agree to these terms.</p>
<h3>1. Products &amp; pricing</h3>
<ul>
<li>All prices are in Bangladeshi Taka (৳).</li>
<li>Product photos show the item. Colour and packaging can vary slightly.</li>
<li>Prices, offers and stock can change without notice.</li>
</ul>
<h3>2. Orders</h3>
<ul>
<li>We may call you to confirm an order before it is shipped.</li>
<li>We may cancel an order if a product is out of stock, the price was listed incorrectly, or the details cannot be verified. Any payment already taken is refunded in full.</li>
</ul>
<h3>3. Payment</h3>
<ul>
<li>We accept Cash on Delivery and online payment through <strong>shurjoPay</strong> (bKash, Nagad, Rocket, Visa, Mastercard and other supported methods).</li>
<li>Online payments are processed by shurjoPay. We never see or store your card or wallet PIN.</li>
</ul>
<h3>4. Delivery</h3>
<ul>
<li>Inside Dhaka: usually within 24 to 48 hours. Outside Dhaka: usually within 2 to 5 business days.</li>
<li>Please check the product before you accept it.</li>
<li>If delivery fails because of a wrong address or an unreachable phone, a re-delivery charge may apply.</li>
</ul>
<h3>5. Privacy</h3>
<p>Your name, phone number and address are used to process and deliver your order. They are not sold to anyone else.</p>
<h3>6. Returns</h3>
<p>See our <a href="refund-returns.html">Refund &amp; Returns Policy</a>.</p>
<h3>7. Contact</h3>
<ul class="icon-list">
<li><i class="fa-solid fa-phone"></i><span>Phone: <a href="tel:{$phone}">{$phone}</a></span></li>
<li><i class="fa-brands fa-whatsapp"></i><span>WhatsApp: <a href="https://wa.me/8801754471654" target="_blank" rel="noopener">{$phone}</a></span></li>
</ul>
HTML],
        ];
    }
}
