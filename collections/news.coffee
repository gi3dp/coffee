@News = new Meteor.Collection('News');

Schemas.News = new SimpleSchema
	title:
		type:String
		max: 60

	content:
		type: String
		autoform:
			afFieldInput:
				type: 'summernote'

	createdAt:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional:true
		autoValue: ->
			if this.isUpdate
				new Date()

	picture:
		type: String
		autoform:
			afFieldInput:
				type: 'fileUpload'
				collection: 'Attachments'

	category:
		type: String
		autoform:
			type:'select-radio-inline'
			options: ->
				[
					{label:'公司动态',value:'companyNews'}
					{label:'行业资讯',value:'industryNews'}
				]

	owner:
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id

News.attachSchema(Schemas.News)

News.helpers
	author: ->
		user = Meteor.users.findOne(@owner)
		if user?.profile?.firstName? and user?.profile?.lastName
			user.profile.firstName + ' ' + user.profile.lastName
		else
			user?.emails?[0].address
