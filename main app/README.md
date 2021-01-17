
## *Inspiration*

We saw *dementia* as a problem unaddressed. Seeing *our own family members* become a victim of this disorder, watching the steep decline in their cognitive senses and loss of their confidence leading to agitation and mental unrest ignited a fire in us to do something about this problem. One of the things that cripple the patients is the dependence on their caretaker for every tiny job. Life amidst the pandemic has become harder as self-isolation means no access to regular therapy sessions or their caretakers and nurses. Old age homes suffer from multiple patients and insufficient staff to pay attention to each one of their needs. We aimed to address these issues and come up with a design that will enable the caretaker, the patient, and the doctor to be in one loop and maintain contact without putting themselves at risk of the Covid-19.

## *What it does*

<p>We aimed to split our design into three - one for the patient, one for the caretaker, and the other for the therapist/doctor.</p>
<p>Let's first take a look at the caretaker’s user interface On the home page, we have information about the patient's whereabouts, the pulse data, and the battery status of the designed band. The pulse is constantly updated enabling the caretaker to keep track of the highs and lows and be alert about the onset of an anxiety attack. When we click on step out, the caretaker can set the boundary to the home and the neighborhood - the geofence. We also tried to incorporate the findings of the reminiscence theory which has been proven powerful by various studies. Nostalgia in the form of music can calm the person down and bring back the memory of a long lost song. The caretaker can set a task from our predefined list of tasks or can even upload a picture of their own and set customizable tasks. For example, instead of the caretaker saying “Take your medicines”, they can actually take a picture of the particular medicine box and upload it, for the patient to not get confused. This will be directly communicated to the patient’s app. We also have big colored buttons for calling the caretaker directly, without going through the pain of searching for the number in the contacts, A “go out” button for stepping out with the knowledge of the caretaker and refreshment for playing audio or music.</p>
<p>When the person is out with the knowledge of the caretaker, the call button along with tasks is available for easy comprehension. When the patient steps out without the knowledge of the caretaker, an immediate alert is sent to the caretaker, constant vibrations are given to the wristband of the user (along with a flashing LED light) and an alarm on the phone triggers them to call the caretaker immediately and let them know where they are off to. More than 40% of people suffering from dementia face episodes of getting lost. Many citizens were never found after.</p>
3 kinds of emergencies are taken into account: 
<li>1) Anxiety attack</li>
 <li>2) Geofence crossed </li>
 <li> 3) Both anxiety attack and geofence crossed </li>
 <p> When the Geofence is crossed, the caretaker is immediately alerted, constant vibrations are given on the smart band along with beeps from the app, urging the call button to be pressed. Patients tend to get panicky when they think they are in unrecognizable zones, and this can even trigger anxiety attacks. This is where the nostalgia element that I was talking about before, comes to play.</p>
 <p>When the pulse rate starts to rise, soothing music or Audio of the caretaker can be played to let the patient maintain their composure. To keep the Doctor in the loop, we have a separate doctor's UI.</p>
 <p>On the home screen, we have
 <li> 1) Number of patients under him </li>
  <li>2) Updated Daily Reports from the caretaker</li>
 <li> 3) Upcoming appointments</li></p>
 <p>When clicked on the number of patients under him, we can see a list. When selected a specific patient, history of an anomaly in heart rate and anxiety attack and geofence crossed are shown with the daily report of how the patient is feeling. These reports come in handy during the virtual therapy sessions as the doctor has a much more detailed insight into the patient’s troubles and issues. When navigated to the upcoming appointments, all the appointments for that week are shown. Factoring in the precautionary methods to be followed during the COVID-19 pandemic, The patient will get a notification pop up on his phone (with beeps) and vibrations on his band once every hour to wash and sanitize himself. We made use of augmented reality to guide the person to the nearest sink using a line string and playing a detailed video of a guide to washing hands. When the camera is pointed at the picture(target image), a detailed video starts to play on washing hands for 20 seconds.</p>
 <p>A simple tile matching memory game is included in the patient's application which can train the cognitive intelligence of the person and also providing the doctor with a tool for patient examination. .</p>
<p>The location of the patient is fed to the machine learning model(which is trained to identify if the current location of the patient is familiar to them or not) using a geolocation sensor, the model will then predict whether this location/area is familiar or not to the patient and this information is sent to their respective guide.If the patient leaves the geofence then an alert is sent to their caretaker.</p>

## *How we built it*

 <li>1) For Designing the patient, Doctor's the caretaker's interfaces, we made use of Flutter. </li> 
  <li>2) Firebase was used as the cloud service to store and retrieve the tasks allocated by the caretaker for the patient, for the caretaker to upload music and voice notes that can be used as an element of nostalgia to calm the patient in situations of anxiety. </li>
  <li>3) We made use of Arduino which included various sensors and processors.  </li>
  <li>4) Unity & Vuforia was used to include the AR component of the device! As mentioned above, we use image recognition to play a detailed video about washing hands. </li>
  <li>5) Unity was used to make the tile matching memory game </li>
  <li>6) The ML model was build using ensemble techniques and then deployed in form of rest api using flask.</li>

## *Challenges we ran into*

The major challenge in this project was to incorporate technology into a patient’s life. Usually, people with weaker cognitive sense are advised to refrain from the usage of technology as it can lead to more stress. So we had to think of the ideal way to use technology in such a way that it does not become a nuisance. Working with sensors that we hadn’t worked with before like GPS was a tough task and we struggled to get accurate data. We also had trouble integrating the machine learning model to our app.Moreover dealing with augmented reality for the first time, we stepped out of our comfort zones and had to learn to use unity and vuforia to use them as our tools for the project.

## *Accomplishments that we're proud of*

Our team understood the difficulties that a dementia patient faces with technology and keeping that in mind we aimed to keep our design as simple as possible. The application has big buttons with large font size text for clear instructions, tasks are illustrated using images and the health band has no fancy confusing shenanigans, just a simple SOS button in cases of emergency. This differs our health band from the hundreds that are already available in the market, no requirement of a steep learning curve to get accustomed to the technology, it is the tech that gets accustomed to your needs. The ease of usability brought to the patient with our design which was developed in a short time frame is something we are proud of.

## *What we learned*

We learned to look at every aspect of the user’s needs to come up with the most ideal design. The Design Spirit Workshop at the Tech Together, Boston - 2020, in particular, helped us a lot. We learned a new technology - Augmented reality in a short span of time which was a scary but exciting experience.We even learned how to deploy ML model as an api and integrate it with flutter.We wish to take this project further, learning and growing along the way.

## *What's next for Cogniflex*

We're in the prototyping stage with about 75% of the software, and hardware complete. We wish to complete our prototype of the wrist band and try testing it at working homes to check the efficiency of the solution. Based on the feedback received we wish to optimize the project to its best potential and get it patented so as to make a mark in the health and wellness industry.
