<img src="https://www.crushpixel.com/static16/preview2/stock-photo-fastfood-hand-drawn-cartoon-doodles-illustration-colorful-vector-banner-2371639.jpg" width=100%><br>

# Orderac
We know that during this COVID time many industries are failing to grow as they were growing before.<br>
But some are growing faster than ever before.<br>
And one of them is: **Food industry**

So, what our problem is when we go to a mall, 
the very first things we find is crowd, especially in **food courts**,
there are more people standing in a food court than the people having a seat and eating their food.

So, we are going to create an **App** & a **Website**, 
which people can use to order food directly from our app from anywhere inside the mall,
rather than standing in a queue to order their food.
And the website will be available to the respective food courts from where 
food courts can see their respective list of orders.

- This will decrease the crowd in the food courts
- This will make the food ordering process faster
- Food courts will get more orders as user don't have to stand for very long
- This can be implemented in every mall

## Community
**[Code of Conduct](https://github.com/inaxia/attendance_using_face_recognition/blob/master/CODE_OF_CONDUCT.md)**<br>
**[Contributing to Inaxia](https://github.com/inaxia/attendance_using_face_recognition/blob/master/CONTRIBUTING.md)**

## Steps to run

1. Fork this repo
2. Clone the forked repo
3. Open the main/parent `orderac` folder

**`orderac` -> app**<br>
**`orderac_web` -> web**

**For running app:**<br>
Run the following commands:

1. `cd .\orderac\` -> after running this, directory should be '..\orderac\orderac'
2. `flutter channel stable`
3. `flutter upgrade`
4. `flutter run` -> make sure an android/emulator device is connected

**For running web:**<br>
If you want to run app & web simultaneously, you have to open a new window of any IDE and then run the following commands:

1. `cd ..` -> if you are still in '..\orderac\orderac'
2. `cd .\orderac_web\` -> after running this, directory should be '..\orderac\orderac_web'
3. `flutter channel beta`
4. `flutter upgrade`
5. `flutter run` -> it will ask 'In which browser you want to run your app'
