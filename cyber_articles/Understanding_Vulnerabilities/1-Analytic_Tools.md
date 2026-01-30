# 1- ANALYTIC TOOLS

### A) Introduction
>Static and dynamic analysis are two fundamentals approaches used to assess the security of software analysis. Both aim to identify vulnerabilities, but they differ in how and when the analysis performed during the software development lifecycle.

>`Static analysis` examines the source code, bytecode or binaries of an application without executing it. By analyzing the structure and logic of the code, static analysis tools can identify `potential security weaknesses` such as coding errors, insecure patterns or violations of best practices early in the development process.

>In contrast, `dynamic analysis` evaluates software while it is running. This approach focuses on observing the application's behavior during execution, often by interacting with it in real time. Dynamic analysis is particularly effective at `identifying runtime issues` such as authentication flaws, input validation problems or unexcepted system behaviors that may not be visible through code inspection alone.

These tools are essential for software security because they address different aspects of risk. Static analysis prevents vulnerabilities during development step, while dynamic analysis helps uncover weaknesses during execution. Together, they contribute to more effective security practices by providing broader visibility into potential attack vectors across the software lifecycle.

### B) Historical Context
>Static and dynamic analysis techniques emerged from early efforts to improve software reliability and quality. Initially, code reviews and basic testing were primarily used to identify functional errors rather than security vulnerabilities.

>As software systems became more complex and interconnected, security concerns gained importance. Static analysis evolved to automatically inspect large codebases for patterns associated with known weaknesses, while dynamic analysis advanced through more structured testing of applications during execution.

Today, both approaches are integral to modern software security practices. They have adapted to support agile development, continuous integration and evolving threat landscapes, making them esssential components of secure software development processes.

### C) Types of analytic tools
>Static and dynamic analysis tools play complementary role in software security, each being effective at different stages of the development and testing process.

>Static analysis tools are most effective durng the early phases of software development. By analyzing source code or compiled artifacts without executing the application, these tools can identify insecure coding patterns, logical flaws and violations of security best practices. Static analysis is particularly useful for detecting issues such as improper input handling or unsafe function usage befire the software is deployed.

>Dynamic analysis tools operate on running applications. They are commonly used in testing or staging environments to observe how software behaves under real conditions. By interacting with the application during execution, dynamic analysis can uncover vulnerabilities related to runtime behavior such as authentication weaknesses, session management issues or improper error handling.

Each approach addresses different types of security risks. Static analysis provides early visibility into potential weaknesses at the code level while dynamic analysis reveals issues that only appear when the running time of the application. Using both types of tools allows organizations to achieve more comprehensive coverage and reduce the likelihood of undetected vulnerabilities.

### D) Impact of analysis tools on software security
>Static and dynamic analysis tools play a significant role in strengthening software security when they are properly integrated into development and testing workflows. Rather than being used as isolated activities, these tools are most effective when embedded throughout the software development lifecycle.

>Static analysis is commonly integrated early in development, often as part of code reviews or continuous integration pipelines. By identifying potential security issues before deployment, it helps reduce the cost and effort required to fix vulnerabilities later in the process. This proactive approach supports more secure coding practices and improves overall code quality.

>Dynamic analysis complements this approach by focusing on how applications behave at runtime. It is typically applied during testing phases to identify vulnerabilities that cannot be detected through static inspection alone. Issues related to authentication, authorization or runtime configuration are often revealed through this.

When used together, static and dynaic analysis tools provide a more comprehensive view of software security. Each approach compensates for the limitations of the other, allowing organizations to detect a wider range of vulnerabilities and improve their ability to protect systems in evolving threat environments.

### E) Conclusion
Static and dynamic analysis tools are essential components of modern software security practices. While static analysis focuses on identifying potential weaknesses within the code, dynamic analysis examines application behavior during runtime. Each approach targets different categories of vulnerabilities and addresses distinct stages of the software development lifecycle.
