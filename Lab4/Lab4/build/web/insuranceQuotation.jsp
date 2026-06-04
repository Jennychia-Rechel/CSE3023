<%-- 
    Document   : insuranceQuotation
    Created on : 21 Apr 2026, 3:34:26 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insurance Quotation System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 40px;
        }
        .container {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
        }
        /* Header Ungu */
        .main-header {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
            font-weight: bold;
        }
        /* Card Putih */
        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        /* Fieldset untuk Insurance Calculation */
        fieldset {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        legend {
            font-size: 0.9rem;
            color: #666;
            padding: 0 10px;
        }
        /* Form Styling */
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 0.85rem;
            color: #333;
        }
        input[type="text"], 
        input[type="number"], 
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 0.9rem;
        }
        /* Buttons */
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .btn {
            padding: 8px 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.85rem;
            background-color: #e0e0e0;
        }
        .btn:hover {
            background-color: #d4d4d4;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="main-header">
        Insurance Quotation
    </div>

    <div class="card">
        <form action="processInsuranceQuo.jsp" method="POST">
            <fieldset>
                <legend>Insurance Calculation</legend>

                <div class="form-group">
                    <label>IC No*</label>
                    <input type="text" name="icNo" placeholder="E.g. 821210-01-3478" required>
                </div>

                <div class="form-group">
                    <label>Name*</label>
                    <input type="text" name="custName" placeholder="Enter name" required>
                </div>

                <div class="form-group">
                    <label>Market Price*</label>
                    <input type="number" name="marketPrice" placeholder="Price" min="1" required>
                </div>

                <div class="form-group">
                    <label>Coverage Type</label>
                    <select name="coverageType" required>
                        <option value="Third Party">Third Party</option>
                        <option value="Comprehensive">Comprehensive</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>No Claims Discount (NCD)</label>
                    <select name="ncdRate">
                        <option value="0">0%</option>
                        <option value="25">25%</option>
                        <option value="30">30%</option>
                        <option value="38.33">38.33%</option>
                        <option value="45">45%</option>
                        <option value="55">55%</option>
                    </select>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn">Submit</button>
                    <button type="reset" class="btn">Cancel</button>
                </div>
            </fieldset>
        </form>
    </div>
</div>

</body>
</html>
