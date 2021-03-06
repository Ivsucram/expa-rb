# EXPA

Hi, this is an unofficial EXPA API developed by [AIESEC in Brazil](http://www.aiesec.org.br).
It encapsules the code in ruby (so far only some functions for Peoples, Offices and Applications. More than enought to you automate all the OP-CF at your entity)

## Functionalities

Follow this task list as *things are done and things that next priority*.

- [x] Automatically re-login after sometime. Assure that you can download tons of data from EXPA server with get logged out
- [x] Get all People profiles
- [x] Get a person attributes
- [x] Get all applications from a person
- [ ] Wrap every Peoples API function
- [ ] Wrap every Applications API function
- [ ] Wrap every Offices API function

## Installation

So far the gem is not public available at the gem repository. If you want to install, you need to clone this repo.
The gem will made public available after AIESEC in Brazil test and use it on its real applications (around Q2 2016)

## Usage

First run 

```
expa = EXPA.setup().auth('email', 'password')
```

From here you can do everything you need, like:

```
EXPA::People.list
```

This functions will list every person that sign up at EXPA in your domain.
- What is the domain? 
   - - If you have a **local** permission account (EB, PM, Manager), you will get only people that signed up for **your LC**.
   - - If you have a **national** permission account (MC, NST), you will get only people that signed up for **your entity/country**.
   - - If you have an **international** permission account (Ai, GST), you will get **everyone**.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AIESEC-no-Brasil/expa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

If you have feedback, suggestions or just wanna help, contact me at: marcus.carvalho@aiesec.net with the subject *__EXPA Ruby API Development__*


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

